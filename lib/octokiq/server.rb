require 'etc'

module Octokiq
  module Server
    extend self

    class Configuration
      attr_accessor :concurrency,
                    :queues,
                    :thread_mode

      def initialize
        @concurrency = Etc.nprocessors
        @queues = [Consts::DEFAULT_QUEUE]
        @thread_mode = false
      end
    end

    def configure
      yield(configuration)
    end
  
    def configuration
      @configuration ||= Configuration.new
    end

    def start
      configuration.thread_mode ? handle_thread_jobs : ractor_workers

      loop do
        job = connection.fetch(queues)
        pipe << job
      end
    end

    private

    def connection
      @connection ||= Connection.new
    end

    def ractor_workers
      @ractor_workers ||= (1..concurrency).map do
        Ractor.new(pipe) do |pipe|
          while job = pipe.take
            Ractor.yield Processor.new(job).run
          end
        end
      end
    end

    def handle_thread_jobs
      semaphore = Mutex.new
      counter = 0
      Thread.new do
        while counter < concurrency && job = pipe.take
          semaphore.synchronize { counter += 1 }
          Thread.new do
            Processor.new(job).run
            semaphore.synchronize { counter -= 1 }
          end
        end
      end
    end

    def thread_workers
      @thread_workers = []
      Thread.new do
        while job = pipe.take
          Processor.new(job).run
        end
      end
      @thread_workers
    end

    def concurrency
      @concurrency ||= configuration.concurrency
    end

    def queues
      configuration.queues
    end

    def pipe
      @pipe ||= Ractor.new do
        loop do
          Ractor.yield Ractor.receive
        end
      end
    end
  end
end

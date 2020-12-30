module Octokiq
  class Server
    def start
      handle_pipe
      handle_tube

      loop do
        job = Octokiq.server_connection.fetch(queues)
        Octokiq.configuration.force_thread_mode ? tube << job : pipe << job
      end
    end

    private

    def handle_pipe
      (1..Octokiq.configuration.processors_count).map do
        Ractor.new(pipe, tube) do |pipe, tube|
          loop do
            job = pipe.take
            begin
              Processor.new(job).run
            rescue Ractor::IsolationError => e
              Octokiq.logger.warn 'Ractor::IsolationError'
              tube << job
            end
          end
        end
      end
    end

    def handle_tube
      Thread.new do
        loop do
          job = tube.take
          Thread.new do
            Processor.new(job).run
          end
        end
      end
    end

    def queues
      Octokiq.configuration.queues
    end

    def pipe
      @pipe ||= Ractor.new do
        loop do
          Ractor.yield Ractor.receive
        end
      end
    end

    def tube
      @tube ||= Ractor.new do
        loop do
          Ractor.yield Ractor.receive
        end
      end
    end
  end
end

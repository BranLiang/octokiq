module Octokiq
  class Server
    def start
      (1..Octokiq.configuration.processors_count).map do
        Ractor.new(pipe) do |pipe|
          job = pipe.take
          processor = Processor.new(job)
          processor.run
        end
      end

      loop do
        job = Octokiq.server_connection.fetch(queues)
        pipe << job
      end
    end

    private

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
  end
end

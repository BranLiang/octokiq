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
        _, job = Ractor.select(*queues)
        pipe << job
      end
    end

    private

    def queues
      @queues ||= Octokiq.configuration.queues.map do |queue|
        Ractor.new(queue) do |q|
          connection = Connection.new
          loop do
            Ractor.yield connection.fetch(q)
          end
        end
      end
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

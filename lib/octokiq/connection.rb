module Octokiq
  class Connection
    attr_accessor :redis

    def initialize
      @redis = Redis.new
    end

    def fetch(queues)
      redis.blpop(*build_queues(queues), 0)
    end

    def push(queue, data)
      redis.rpush(build_queue(queue), data)
    end

    private

    def build_queues(queues)
      queues.map { |q| build_queue(q) }
    end

    def build_queue(queue)
      "#{Octokiq.configuration.queue_prefix}:#{queue}"
    end
  end
end

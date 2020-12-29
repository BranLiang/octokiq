module Octokiq
  class Connection
    attr_accessor :redis

    def initialize
      @redis = Redis.new
    end

    def fetch(queue)
      redis.blpop(
        "#{Octokiq.configuration.queue_prefix}:#{queue}",
        Octokiq.configuration.fetch_timeout
      )
    end

    def push(queue, data)
      redis.rpush(
        "#{Octokiq.configuration.queue_prefix}:#{queue}",
        data
      )
    end
  end
end

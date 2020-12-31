module Octokiq
  module Client
    extend self

    class Configuration
      attr_accessor :default_queue

      def initialize
        @default_queue = Consts::DEFAULT_QUEUE
      end      
    end

    def push(*args)
      connection.push(*args)
    end

    def configure
      yield(configuration)
    end
  
    def configuration
      @configuration ||= Configuration.new
    end

    private

    def connection
      @connection ||= Connection.new
    end
  end
end
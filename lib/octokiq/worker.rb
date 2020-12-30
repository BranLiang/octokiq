module Octokiq
  module Worker
    CLASS_KEY = 'class'.freeze
    ARGS_KEY = 'args'.freeze

    class Configuration
      OPTIONS = [:queue].freeze
      attr_accessor(*OPTIONS)

      def initialize
        @queue = Octokiq.configuration.default_queue
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def perform_async(*args)
        client_push(CLASS_KEY => self, ARGS_KEY => args)
      end

      def configuration
        @configuration ||= Configuration.new
      end

      def octokiq_options(opts)
        opts.slice(*Configuration::OPTIONS).each do |key, value|
          configuration.instance_variable_set("@#{key}", value)
        end
      end

      private

      def client_push(item)
        Octokiq.client_connection.push(configuration.queue, item)
      end
    end
  end
end

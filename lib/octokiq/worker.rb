module Octokiq
  module Worker
    class Configuration
      OPTIONS = [:queue].freeze
      attr_accessor(*OPTIONS)

      def initialize
        @queue = Client.configuration.default_queue
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def perform_async(*args)
        _push(Consts::ITEM_CLASS_KEY => self, Consts::ITEM_ARGS_KEY => args)
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

      def _push(item)
        Client.push(configuration.queue, item)
      end
    end
  end
end

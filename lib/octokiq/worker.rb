module Octokiq
  module Worker
    CLASS_KEY = 'class'.freeze
    ARGS_KEY = 'args'.freeze

    def self.included(base)
      base.extend(ClassMethods)
      base.queue(Octokiq.configuration.default_queue)
    end

    module ClassMethods
      def perform_async(*args)
        client_push(CLASS_KEY => self, ARGS_KEY => args)
      end

      def queue(name)
        @@queue = name
      end

      private

      def client_push(item)
        Octokiq.client_connection.push(@@queue, item)
      end
    end
  end
end

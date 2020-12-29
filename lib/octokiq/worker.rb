module Octokiq
  module Worker
    def self.included(base)
      base.extend(ClassMethods)
      base.queue(Octokiq.configuration.default_queue)
    end

    module ClassMethods
      def perform_async(*args)
        client_push('class' => self, 'args' => args)
      end

      def queue(name)
        @@queue = name
      end

      private

      def client_push(item)
        Octokiq.client_connection.push(@@queue, item.to_json)
      end
    end
  end
end

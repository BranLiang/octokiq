module Octokiq
  module Worker
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def perform_async(*args)
        client_push('class' => self, 'args' => args)
      end

      def client_push(item)
        # push data to redis
      end
    end
  end
end

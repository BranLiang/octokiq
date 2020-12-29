module Octokiq
  class Configuration
    attr_accessor :processors_count,
                  :queue_prefix,
                  :default_queue,
                  :queues

    def initialize
      @processors_count = Etc.nprocessors
      @queue_prefix = 'octokiq'
      @default_queue = 'default'
      @queues = [@default_queue]
    end
  end
end

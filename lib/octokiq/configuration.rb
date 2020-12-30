module Octokiq
  class Configuration
    attr_accessor :processors_count,
                  :queue_prefix,
                  :default_queue,
                  :queues,
                  :force_thread_mode

    def initialize
      @processors_count = Etc.nprocessors
      @queue_prefix = 'octokiq'
      @default_queue = 'default'
      @queues = [@default_queue]
      @force_thread_mode = false
    end
  end
end

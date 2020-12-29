module Octokiq
  class Configuration
    attr_accessor :processors_count,
                  :fetch_timeout,
                  :queue_prefix,
                  :queues

    def initialize
      @processors_count = Etc.nprocessors
      @fetch_timeout = 1
      @queue_prefix = 'octokiq'
      @queues = ['default']
    end
  end
end

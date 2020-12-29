module Octokiq
  class Configuration
    attr_accessor :processors_count,
                  :queue_prefix,
                  :queues

    def initialize
      @processors_count = Etc.nprocessors
      @queue_prefix = 'octokiq'
      @queues = ['default']
    end
  end
end

module Octokiq
  class Configuration
    attr_accessor :queue_prefix

    def initialize
      @queue_prefix = Consts::QUEUE_PREFIX
    end
  end
end

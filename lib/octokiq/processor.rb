module Octokiq
  class Processor
    attr_accessor :klass, :args
    def initialize(job)
      klass_name = job.fetch(Consts::ITEM_CLASS_KEY)
      @args = job.fetch(Consts::ITEM_ARGS_KEY)
      @klass = Object.const_get(klass_name)
    end

    def run
      klass.new.perform(*args)
    end
  end
end

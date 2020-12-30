module Octokiq
  class Processor
    attr_accessor :klass, :args
    def initialize(job)
      klass_name = job.fetch(Worker::CLASS_KEY)
      @args = job.fetch(Worker::ARGS_KEY)
      @klass = Object.const_get(klass_name)
    end

    def run
      klass.new.perform(*args)
    end
  end
end

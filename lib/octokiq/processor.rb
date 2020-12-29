module Octokiq
  class Processor
    attr_accessor :job
    def initialize(job)
      @job = job
    end

    def run
      Octokiq.logger.info "Job: #{job}"
      klass = job.fetch(Worker::CLASS_KEY)
      args = job.fetch(Worker::ARGS_KEY)
      Object.const_get(klass).new.perform(*args)
    end
  end
end

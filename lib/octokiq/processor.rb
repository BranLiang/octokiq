module Octokiq
  class Processor
    attr_accessor :job
    def initialize(job)
      @job = job
    end

    def run
      # Run the job
      puts job
    end
  end
end
module Octokiq
  class CMD
    def run
      puts logo
      Server.start
    rescue Interrupt
      Octokiq.logger.info 'Bye!'
    end

    private

    def logo
      "Hello! Welcome to Octokiq!"
    end
  end
end

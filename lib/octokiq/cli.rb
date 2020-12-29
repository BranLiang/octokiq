module Octokiq
  class CLI
    def run
      server = Server.new
      server.start
    end
  end
end

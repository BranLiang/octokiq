require 'redis'

require 'etc'

require 'octokiq/version'
require 'octokiq/configuration'
require 'octokiq/connection'
require 'octokiq/worker'
require 'octokiq/processor'
require 'octokiq/server'
require 'octokiq/cli'

module Octokiq
  extend self
  class Error < StandardError; end

  def configure
    yield(configuration)
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def server_connection
    @server_connection ||= Connection.new
  end
end

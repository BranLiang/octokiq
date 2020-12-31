require 'octokiq/version'
require 'octokiq/logger'
require 'octokiq/connection'
require 'octokiq/consts'
require 'octokiq/configuration'
require 'octokiq/processor'
require 'octokiq/client'
require 'octokiq/server'
require 'octokiq/worker'
require 'octokiq/cmd'

module Octokiq
  extend self
  class Error < StandardError; end

  def configure
    yield(configuration)
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def logger
    Logger.new($stdout)
  end
end

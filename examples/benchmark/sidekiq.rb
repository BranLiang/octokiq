require 'sidekiq'
require 'prime'
require_relative './function'

Sidekiq.configure_server do |config|
  config.logger = nil
end

class LoadWorker
  include Sidekiq::Worker

  sidekiq_options retry: 1
  include Function
end

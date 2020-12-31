require 'octokiq'
require 'prime'
require_relative './function'

Octokiq::Server.configure do |c|
  c.thread_mode = true
end

class LoadWorker
  include Octokiq::Worker
  include Function
end

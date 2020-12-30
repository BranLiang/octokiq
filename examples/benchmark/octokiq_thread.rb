require 'octokiq'
require 'prime'
require_relative './function'

Octokiq.configure do |c|
  c.force_thread_mode = true
end

class LoadWorker
  include Octokiq::Worker
  include Function
end

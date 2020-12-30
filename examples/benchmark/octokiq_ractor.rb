require 'octokiq'
require 'prime'
require_relative './function'

class LoadWorker
  include Octokiq::Worker
  include Function
end

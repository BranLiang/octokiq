require 'bundler/setup'
require 'redis'
# require_relative './sidekiq'
require_relative './octokiq_ractor'
# require_relative './octokiq_thread'
require_relative './function'

Redis.new.flushall

(1..Function::NUMBER_COUNT).each do |n|
  LoadWorker.perform_async(n)
end

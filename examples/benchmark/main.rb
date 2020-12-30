require 'redis'
# require_relative './sidekiq'
require_relative './octokiq_ractor'
# require_relative './octokiq_thread'
NUMBER_COUNT = 1_000_00

Redis.new.flushall

(1..NUMBER_COUNT).each do |n|
  LoadWorker.perform_async(n)
end

require 'octokiq'

Octokiq.configure do |c|
  c.queues = %i[high medium low]
end

class DummyWorker
  include Octokiq::Worker

  queue :high

  def perform(name)
    puts "Hey, #{name}"
  end
end

require 'octokiq'

Octokiq.configure do |c|
  c.queues = %i[default high medium low]
end

class Greeting
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def to_s
    "Hey, #{name}"
  end
end

class DummyWorker
  include Octokiq::Worker

  octokiq_options queue: :high

  def perform(name)
    greeting = Greeting.new(name)
    puts greeting.to_s
  end
end

class NonRactorSafeWorker
  include Octokiq::Worker

  def perform
    ENV['test']
    puts 'Access ENV success'
  end
end

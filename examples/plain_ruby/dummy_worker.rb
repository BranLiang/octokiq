class DummyWorker
  include Octokiq::Worker

  def perform(name)
    puts "Hey, #{name}"
  end
end

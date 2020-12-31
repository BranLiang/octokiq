
module Function
  NUMBER_COUNT = 500000

  def perform(n)
    puts Time.now.to_i.to_s if n === 1
    n.prime?
    puts "#{Time.now.to_i}\r" if n === NUMBER_COUNT
  end
end

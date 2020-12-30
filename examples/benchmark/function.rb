module Function
  def perform(n)
    puts Time.now.to_i.to_s if n === 1
    n.prime?
    print "#{Time.now.to_i}\r"
  end
end

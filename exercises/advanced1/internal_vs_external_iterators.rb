# create new Enumerator object that can iterate over an infinite list of factrials
# test by printing out the first 7 factorial values starting with zero factorial
  # 3! = 1*2*3 = 6
  # print first 7 factorials by using an External iterator.. 
  # and then see what happens when you print 3 more. (shouldn't be correct)
  # reset Enumerator ($rewind)
  # print 7 more factorials

factorials = Enumerator.new do |f|
  f << 1
  num = 1
  loop do
    f << (1..num).to_a.reduce(&:*)
    num += 1
  end
end

7.times { puts factorials.next }
puts ''
3.times { puts factorials.next }

factorials.rewind
puts''

7.times { puts factorials.next }

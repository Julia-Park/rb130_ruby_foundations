# input array and block which returns true depending on value of array element
# return count of times block returns true

def count(array)
  # count = 0

  booleans = array.map do |element|
    yield(element)
  end

  booleans.reduce(0) { |memo, bool| bool ? memo + 1 : memo }

  # array.each do |element|
  #   if block_given?
  #     count += 1 if yield(element)
  #   end
  # end

  # count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

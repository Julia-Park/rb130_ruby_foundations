# the reduce method assigns the return value of the block to the accumulator object
# can initialize a value via optional argument

def reduce(array, initial_value = nil)
  counter = 0
  if initial_value.nil?
    acc = array[0]
    counter += 1
  else
    acc = initial_value
  end
  
  while counter < array.size
    element = array[counter]
    acc = yield(acc, element)
    counter += 1
  end

  acc
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

# input array and block
# yield consecutive elements to block
# return nil

def each_cons(array, elements)
  return nil if array.empty?
  idx = elements - 1

  while idx < array.size
    yield(*array[idx - (elements - 1), elements])
    idx += 1
  end
end


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil

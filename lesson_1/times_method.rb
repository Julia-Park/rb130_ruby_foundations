def times(number)
  counter = 0

  while counter < number
    yield(counter) if block_given?
    counter += 1
  end

  number
end

times(5) do |num|
  puts num
end

# needs to take a block
# needs to have block parameter

# 0
# 1
# 2
# 3
# 4
# => 5

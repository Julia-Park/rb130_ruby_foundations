# input 3 arguments: start value, end value, step value, block (implicit/explicit)

def step(start, end_v, step)
  value = start

  loop do
    yield(value)
    value += step
    break if value > end_v
  end

  value
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
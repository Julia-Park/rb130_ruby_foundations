# input optional block
# execute block if specified and return block return value
# return string 'Does not compute' if no block speified

def compute(argument)
  block_given? ? yield(argument) : 'Does not compute.'
end


# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute(3) { |i| i + 5 } == 8
p compute('string') { |word| "The word is #{word}."} == "The word is string."
p compute(5) == 'Does not compute.'

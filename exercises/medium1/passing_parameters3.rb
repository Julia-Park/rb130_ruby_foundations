items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do |*foods, wheat|
#   puts foods.join(', ')
#   puts wheat
# end

# gather(items) do |apples, *other, wheat|
#   puts apples
#   puts other.join(', ')
#   puts wheat
# end

# gather(items) do |apples, *other|
#   puts apples
#   puts other.join(', ')
# end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end

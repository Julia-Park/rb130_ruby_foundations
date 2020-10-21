# input array
# yield array contents to block

def birds(array)
  yield(array)
end

bird_array = %w(raven finch hawk eagle)

birds(bird_array) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}" }


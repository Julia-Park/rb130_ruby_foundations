# input 0 or more arguments and block
# return total number of arguments for which block is true

def count(*elem, &block)
  count_true = 0

  elem.each do |e|
    count_true += 1 if block.call(e)
  end

  count_true
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

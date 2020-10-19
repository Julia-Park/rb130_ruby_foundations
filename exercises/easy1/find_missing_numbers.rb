# input sorted array of integers
# return array including all missing integers (in order) between first and last element

def missing(array)
  (array[0]..array[-1]).to_a.difference(array)
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

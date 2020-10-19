# return list of all divisors of the positive integer passed in as argument
# return can be any sequence

# def divisors(num)
#   result = []

#   1.upto(num) do |n|
#     result << n if num % n == 0
#   end

#   result
# end

def divisors(num)
  result = [1, num]

  2.upto(num) do |n|
    quotient, remainder = num.divmod(n)
    if remainder == 0
      break if result.include?(n)
      result += [n, quotient]
    end
  end

  result.uniq.sort
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]

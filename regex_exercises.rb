# 1

# def url?(string)
#   regex = /^http[s]?:\/\/\S+\.\S+$/

#   string.match?(regex)
# end

# p url?('http://launchschool.com')   # -> true
# p url?('https://example.com')       # -> true
# p url?('https://example.com hello') # -> false
# p url?('   https://example.com')    # -> false

# 2

# def fields(string)
#   regex = /[\t, ]+/
#   string.split(regex)
# end

# p fields("Pete,201,Student")
# # -> ['Pete', '201', 'Student']

# p fields("Pete \t 201    ,  TA")
# # -> ['Pete', '201', 'TA']

# p fields("Pete \t 201")
# # -> ['Pete', '201']

# p fields("Pete \n 201")
# # -> ['Pete', '\n', '201']

# 3

# def mystery_math(string)
#   regex = /[+\-*\/]/

#   string.sub(regex, '?')
# end

# p mystery_math('4 + 3 - 5 = 2')
# # -> '4 ? 3 - 5 = 2'

# p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # -> '(4 ? 3 + 2) / 7 - 1 = 1'

# 4

# def mysterious_math(string)
#   regex = /[+*\-\/]/

#   string.gsub(regex, '?')
# end

# p mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
# p mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

# 5

# def danish(string)
#   regex = /\b(apple|blueberry|cherry)\b/

#   string.sub(regex, 'danish')
# end

# p danish('An apple a day keeps the doctor away')
# # -> 'An danish a day keeps the doctor away'

# p danish('My favorite is blueberry pie')
# # -> 'My favorite is danish pie'

# p danish('The cherry of my eye')
# # -> 'The danish of my eye'

# p danish('apple. cherry. blueberry.')
# # -> 'danish. cherry. blueberry.'

# p danish('I love pineapple')
# # -> 'I love pineapple'

# 6

# def format_date(date)
#   regex = /(\d{4})-(\d{2})-(\d{2})/

#   date.gsub(regex, '\3.\2.\1')
# end

# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2016/06/17') # -> '2016/06/17' (no change)

# 7

def format_date(date)
  regex = /(\d{4})([-\/])(\d{2})\2(\d{2})/

  date.sub(regex, '\4.\3.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)

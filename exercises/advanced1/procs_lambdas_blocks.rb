# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# my_proc2 = proc { |thing| puts "This is a #{those}."}
# puts my_proc # > #<Proc:0x0000558d75cff410 procs_lambdas_blocks.rb:2>; Proc#to_s
# puts my_proc.class # > Proc
# my_proc.call # > This is a .; Proc has parameter, but does not error without
# my_proc.call('cat') # This is a cat.; Proper execution
# my_proc2.call('cat')


# With Proc, Proc still was able to run without having the proper number of arguments
# passed into it when called.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
that = "PLANT"
my_second_lambda = -> (thing) { puts "This is a #{that}." }
puts my_lambda # > #<Proc:0x000056241c436d40 procs_lambdas_blocks.rb:12 (lambda)>; outputs #inspect
puts my_second_lambda # > outputs # inspect
puts my_lambda.class # > Proc
my_lambda.call('dog') # This is a dog; works as expected
my_second_lambda.call('dog') # works as expected
# my_lambda.call # ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # Uninitalizec constant Lambda

# Lambda is a type of Proc? (from line 16 and 20)
# Lambda can be created by lambda followed by block


# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# horse = 'horse'
# block_method_2('turtle') { puts "This is a #{horse}."}
# block_method_2('turtle') { puts "This is a #{animal}."}


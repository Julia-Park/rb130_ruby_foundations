require 'minitest/autorun' # require all the necessary file to run minitest gem
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car' # require the filename of file we're testing from curent directory

class CarTest < MiniTest::Test
  def test_wheels # instance methods that start with test_ indicate an indiviual test that needs to be run by minitest
    car = Car.new # set up assertion to test against
    assert_equal(4, car.wheels) # first argument is expected value, 2nd is actual value
  end

  # def test_bad_wheels
  #   skip "Incomplete test"
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car
  
    assert_includes(arr, car)
  end
  
  # assert_includes calls assert_equal in its implementation, and Minitest counts that call
  # as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.

end

# When this file is run, it will have the following output:
=begin
Run options: --seed 26148

# Running:

.

Finished in 0.000551s, 1814.2630 runs/s, 1814.2630 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
=end

# The "." on line 18 means the test was run and nothing went wront.
  # if a test is skipped with the skip keyword, it will say "S"
  # if a test failed, it will say "F"
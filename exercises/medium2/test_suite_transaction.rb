require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'transaction'

require 'pry'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(33)
  end

  def test_prompt_for_payment1
    input = StringIO.new("40\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(40, @transaction.amount_paid)
  end
end

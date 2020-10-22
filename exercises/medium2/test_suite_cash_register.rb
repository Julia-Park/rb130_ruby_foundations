require 'minitest/autorun'

require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(33)
  end

  def test_accept_money
    @transaction.amount_paid = 33
    previous_amount = @cash_register.total_money
    @cash_register.accept_money(@transaction)
    current_amount = @cash_register.total_money

    assert_equal(previous_amount + 33, current_amount)
  end

  def test_change
    @transaction.amount_paid = 40

    assert_equal(40 - 33, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $33.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end
end
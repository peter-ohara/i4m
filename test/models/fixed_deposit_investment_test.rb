require 'test_helper'

class FixedDepositInvestmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'compound_interest_with_deposits' do
    principal = 5000
    monthly_deposits = 100
    annual_compounding_frequency = 12
    duration_in_years = 10

    f = FixedDepositInvestment.first
    balance = f.compound_interest_with_deposits(principal, monthly_deposits,
                                                annual_compounding_frequency,
                                                duration_in_years)

    puts "Something wicked this way comes"
    puts balance
    puts balance
    puts "Hello world"

    assert balance.to_i == 23_763
  end
end

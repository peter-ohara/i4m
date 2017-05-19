class WelcomeController < ApplicationController
  def index
    @fixed_deposit_investments = FixedDepositInvestment.all
    @mutual_funds = MutualFund.all
  end
end

class FixedDepositInvestment < ApplicationRecord
  belongs_to :institution

  def interest_rate
    FixedDepositRate.find_by(fixed_deposit_investment: self).interest_rate
  end
end

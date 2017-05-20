class FixedDepositInvestment < ApplicationRecord
  belongs_to :institution

  monetize :minimum_principal_pesewas, as: 'minimum_principal'

  def interest_rate
    FixedDepositRate.find_by(fixed_deposit_investment: self).interest_rate
  end
end

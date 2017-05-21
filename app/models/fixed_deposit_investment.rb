class FixedDepositInvestment < ApplicationRecord
  belongs_to :institution

  has_many :fixed_deposit_rates, inverse_of: :fixed_deposit_investment
  has_many :fd_purchase_attempts, inverse_of: :fixed_deposit_investment

  monetize :minimum_principal_pesewas, as: 'minimum_principal'

  def interest_rate
    fixed_deposit_rates = FixedDepositRate.find_by(fixed_deposit_investment: self)
    fixed_deposit_rates.interest_rate / 10000.0 if fixed_deposit_rates
  end
end

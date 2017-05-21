class FixedDepositInvestment < ApplicationRecord
  belongs_to :institution

  has_many :fixed_deposit_rates, inverse_of: :fixed_deposit_investment
  has_many :fd_purchase_attempts, inverse_of: :fixed_deposit_investment

  monetize :minimum_principal_pesewas, as: 'minimum_principal'

  def interest_rate
    fixed_deposit_rates = FixedDepositRate.find_by(fixed_deposit_investment: self)
    fixed_deposit_rates.interest_rate / 10000.0 if fixed_deposit_rates
  end

  def self.filter(principal, duration, search_query)
    if search_query
      fixed_deposit_investments = FixedDepositInvestment.all
    else
      fixed_deposit_investments = FixedDepositInvestment.all
    end

    if principal
      fixed_deposit_investments = fixed_deposit_investments
                                       .where('minimum_principal_pesewas <= ?',
                                              principal.to_i * 100)
    end

    if duration
      fixed_deposit_investments = fixed_deposit_investments
                                       .where('period_in_days <= ?',
                                              duration)
    end

    fixed_deposit_investments
  end
end

class FixedDepositInvestment < ApplicationRecord
  include PgSearch

  belongs_to :institution

  has_many :fixed_deposit_rates, inverse_of: :fixed_deposit_investment
  has_many :fd_purchase_attempts, inverse_of: :fixed_deposit_investment

  monetize :minimum_principal_pesewas, as: 'minimum_principal'

  # Search through FixedDepositInvestments by their name and description
  pg_search_scope :search_name_and_description,
                  against: [:name, :description],
                  using: {
                      tsearch: {}
                  }

  def interest_rate
    fixed_deposit_rate = FixedDepositRate.find_by(fixed_deposit_investment: self)
    fixed_deposit_rate.interest_rate / 10000.0 if fixed_deposit_rate
  end

  def rate_date
    fixed_deposit_rate = FixedDepositRate.find_by(fixed_deposit_investment: self)
    fixed_deposit_rate.effective_date
  end

  def self.filter(principal, duration, search_query)
    if search_query.blank?
      fixed_deposit_investments = FixedDepositInvestment.all
    else
      fixed_deposit_investments = FixedDepositInvestment.search_name_and_description search_query
    end

    unless principal.blank?
      fixed_deposit_investments = fixed_deposit_investments
                                       .where('minimum_principal_pesewas <= ?',
                                              principal.to_i * 100)
    end

    unless duration.blank?
      fixed_deposit_investments = fixed_deposit_investments
                                       .where('period_in_days <= ?',
                                              duration)
    end

    fixed_deposit_investments
  end
end

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

  def compound_interest_with_deposits(principal, monthly_deposits,
                                      annual_compounding_frequency, duration_in_years)
    p = principal
    pmt = monthly_deposits
    r = interest_rate
    n = annual_compounding_frequency
    t = duration_in_years
    compound_interest(p, r, n, t) + future_value_of_a_series(pmt, r, n, t) # * (1+(r/n))
  end

  def compound_interest(principal, annual_interest_rate, annual_compounding_frequency, duration_in_years)
    p = principal
    r = annual_interest_rate
    n = annual_compounding_frequency
    t = duration_in_years
    p * (1 + (r/n))**(n * t)
  end

  def total_deposits(monthly_deposits, annual_compounding_frequency, duration_in_years)
    monthly_deposits * (annual_compounding_frequency * duration_in_years)
  end

  def total_interest(final_balance, total_deposits, principal)
    final_balance - (total_deposits + principal)
  end

  private

  def future_value_of_a_series(monthly_deposits, annual_interest_rate,
                                annual_compounding_frequency, duration_years)
    pmt = monthly_deposits
    r = annual_interest_rate
    n = annual_compounding_frequency
    t = duration_years
    pmt * ((1 + (r/n)) ** (n*t) - 1) / (r/n)
  end

end

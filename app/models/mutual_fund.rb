class MutualFund < ApplicationRecord
  include PgSearch

  belongs_to :institution

  has_many :mutual_fund_rates, inverse_of: :mutual_fund
  has_many :mutual_fund_purchase_attempts, inverse_of: :mutual_fund

  monetize :minimum_principal_pesewas, as: 'minimum_principal'
  monetize :debit_order_pesewas, as: 'debit_order'

  # Search through MutualFunds by their name and description
  pg_search_scope :search_name_and_description,
                  against: [:name, :description],
                  using: {
                      tsearch: {}
                  }
  def unit_price
    mutual_fund_rate = MutualFundRate.find_by(mutual_fund: self)
    mutual_fund_rate.unit_price_pesewas / 10000.0 if mutual_fund_rate
  end

  def unit_price_pesewas
    MutualFundRate.find_by(mutual_fund: self).unit_price_pesewas
  end

  def yield_to_date
    mutual_fund_rate = MutualFundRate.find_by(mutual_fund: self)
    mutual_fund_rate.yield_to_date / 10000.0 if mutual_fund_rate
  end

  def rate_date
    mutual_fund_rate = MutualFundRate.find_by(mutual_fund: self)
    mutual_fund_rate.effective_date
  end

  def self.filter(principal, duration, search_query)
    if search_query.blank?
      mutual_funds = MutualFund.all
    else
      mutual_funds = MutualFund.search_name_and_description search_query
    end

    unless principal.blank?
      mutual_funds = mutual_funds
                          .where('minimum_principal_pesewas <= ?',
                                 principal.to_i * 100)
    end

    unless duration.blank?
      mutual_funds = mutual_funds
                          .where('min_days_before_withdrawal <= ?',
                                 duration)
    end

    mutual_funds
  end
end

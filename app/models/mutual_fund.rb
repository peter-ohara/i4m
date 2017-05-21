class MutualFund < ApplicationRecord
  belongs_to :institution

  has_many :mutual_fund_rates, inverse_of: :mutual_fund
  has_many :mutual_fund_purchase_attempts, inverse_of: :mutual_fund

  monetize :minimum_principal_pesewas, as: 'minimum_principal'
  monetize :debit_order_pesewas, as: 'debit_order'


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

  def self.filter(principal, duration, search_query)
    if search_query
      mutual_funds = MutualFund.all
    else
      mutual_funds = MutualFund.all
    end

    if principal
      mutual_funds = mutual_funds
                          .where('minimum_principal_pesewas <= ?',
                                 principal.to_i * 100)
    end

    if duration
      mutual_funds = mutual_funds
                          .where('min_days_before_withdrawal <= ?',
                                 duration)
    end

    mutual_funds
  end
end

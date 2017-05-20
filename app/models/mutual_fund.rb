class MutualFund < ApplicationRecord
  belongs_to :institution

  has_many :mutual_fund_rates, inverse_of: :mutual_fund
  has_many :mutual_fund_purchase_attempts, inverse_of: :mutual_fund

  monetize :minimum_principal_pesewas, as: 'minimum_principal'
  monetize :debit_order_pesewas, as: 'debit_order'


  def unit_price
    MutualFundRate.find_by(mutual_fund: self).unit_price_pesewas / 10000.0
  end

  def unit_price_pesewas
    MutualFundRate.find_by(mutual_fund: self).unit_price_pesewas
  end

  def yield_to_date
    MutualFundRate.find_by(mutual_fund: self).yield_to_date
  end
end

class MutualFund < ApplicationRecord
  belongs_to :institution

  def unit_price
    MutualFundRate.find_by(mutual_fund: self).unit_price
  end

  def yield_to_date
    MutualFundRate.find_by(mutual_fund: self).yield_to_date
  end
end

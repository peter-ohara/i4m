class FixedDepositRate < ApplicationRecord
  belongs_to :fixed_deposit_investment

  monetize :unit_price_pesewas, as: 'unit_price'
end

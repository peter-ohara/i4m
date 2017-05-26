class MutualFundRate < ApplicationRecord
  belongs_to :mutual_fund

  monetize :unit_price_pesewas, as: 'unit_price'
end

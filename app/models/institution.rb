class Institution < ApplicationRecord
  has_many :fixed_deposit_investments, inverse_of: :institution
  has_many :mutual_funds, inverse_of: :institution
end

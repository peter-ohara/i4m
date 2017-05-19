class MutualFundPurchaseAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :mutual_fund
end

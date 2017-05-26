class User < ApplicationRecord
  has_many :mutual_fund_purchase_attempts, inverse_of: :user
  has_many :fd_purchase_attempts, inverse_of: :user
end

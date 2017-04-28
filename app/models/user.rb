class User < ApplicationRecord
  has_one :next_of_kin, inverse_of: :user

  has_many :t_bills, inverse_of: :user
end

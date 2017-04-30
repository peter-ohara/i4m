class User < ApplicationRecord
  has_one :next_of_kin, inverse_of: :user

  has_many :saved_t_bills
  has_many :purchased_t_bills

  # TODO: Add uniqueness validation for phone numbers
end

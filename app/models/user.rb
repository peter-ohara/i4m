class User < ApplicationRecord
  has_one :next_of_kin, inverse_of: :user
  
  # TODO: Add uniqueness validation for phone numbers
end

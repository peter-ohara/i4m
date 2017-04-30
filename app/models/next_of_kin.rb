class NextOfKin < ApplicationRecord
  belongs_to :user, inverse_of: :next_of_kin

  validates :name, :phone_number, presence: true
end

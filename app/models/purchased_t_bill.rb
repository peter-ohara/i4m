class PurchasedTBill < ApplicationRecord
  belongs_to :user
  belongs_to :bank_of_ghana_rate

  enum tenure: ['91 days', '182 days']
  monetize :principal_pesewas, as: 'principal'

  validates :tenure, presence: true
end

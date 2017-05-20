class FdPurchaseAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :fixed_deposit_investment

  monetize :principal_pesewas, as: 'principal'
end

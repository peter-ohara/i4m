class TBill < ApplicationRecord
  belongs_to :user, inverse_of: :t_bills

  enum tenure: ['91 days', '182 days']
end

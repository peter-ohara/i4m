# This model allows is used for storing the TBill rates by bank of Ghana
# which change each week.
class BankOfGhanaRate < ApplicationRecord

  validates :discount_rate_91_days,
            :interest_rate_91_days,
            :discount_rate_182_days,
            :interest_rate_182_days,
            :start_date,
            :end_date, presence: true

  validates :discount_rate_91_days,
            :interest_rate_91_days,
            :discount_rate_182_days,
            :interest_rate_182_days,
            # Length should not be more than 6 digits
            length: { is: 6, message: 'rates should be 6 digits' },
            # Should be an integer greater than zero
            numericality: { only_integer: true, greater_than: 0 }

end

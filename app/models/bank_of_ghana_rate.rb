class BankOfGhanaRate < ApplicationRecord


  validates :discount_rate_91_days,
            :interest_rate_91_days,
            :discount_rate_182_days,
            :interest_rate_182_days,
            :start_date,
            :end_date, presence: true
end

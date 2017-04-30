# This model allows is used for storing the TBill rates by bank of Ghana
# which change each week.
class BankOfGhanaRate < ApplicationRecord

  has_many :saved_t_bills

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

  def name
    return if start_date.nil? || end_date.nil?
    "#{start_date} to #{end_date}"
  end

  def self.current_rate
    now = DateTime.current
    BankOfGhanaRate.where('start_date <= ?', now)
                   .where('end_date >= ?', now - 2.days)
                   .first
  end
end


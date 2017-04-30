class CreateBankOfGhanaRates < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_of_ghana_rates do |t|
      t.integer :discount_rate_91_days
      t.integer :interest_rate_91_days
      t.integer :discount_rate_182_days
      t.integer :interest_rate_182_days
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

class CreateFixedDepositRates < ActiveRecord::Migration[5.0]
  def change
    create_table :fixed_deposit_rates do |t|
      t.references :fixed_deposit_investment, foreign_key: true
      t.integer :interest_rate
      t.date :effective_date

      t.timestamps
    end
  end
end

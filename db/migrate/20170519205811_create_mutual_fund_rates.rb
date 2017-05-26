class CreateMutualFundRates < ActiveRecord::Migration[5.0]
  def change
    create_table :mutual_fund_rates do |t|
      t.references :mutual_fund, foreign_key: true
      t.integer :unit_price_pesewas
      t.integer :yield_to_date
      t.date :effective_date

      t.timestamps
    end
  end
end

class CreateMutualFunds < ActiveRecord::Migration[5.0]
  def change
    create_table :mutual_funds do |t|
      t.references :institution, foreign_key: true
      t.string :name
      t.integer :minimum_principal_pesewas
      t.integer :debit_order_pesewas
      t.integer :management_fee_rate
      t.integer :min_days_before_withdrawal
      t.integer :risk_rating
      t.text :links
      t.string :email
      t.string :phone_number
      t.text :description

      t.timestamps
    end
  end
end

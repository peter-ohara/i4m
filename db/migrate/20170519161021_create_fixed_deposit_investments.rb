class CreateFixedDepositInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :fixed_deposit_investments do |t|
      t.references :institution, foreign_key: true
      t.string :name
      t.integer :period_in_days
      t.integer :minimum_principal_pesewas
      t.integer :risk_rating
      t.text :links
      t.string :email
      t.string :phone_number
      t.text :description

      t.timestamps
    end
  end
end

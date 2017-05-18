class CreateFixedDepositInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :fixed_deposit_investments do |t|
      t.references :institution, foreign_key: true
      t.string :name
      t.text :description
      t.integer :tenure
      t.integer :minimum_principal_pesewas

      t.timestamps
    end
  end
end

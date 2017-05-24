class CreateMutualFundPurchaseAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :mutual_fund_purchase_attempts do |t|
      t.references :user, foreign_key: true
      t.references :mutual_fund, foreign_key: true
      t.integer :principal_pesewas

      t.timestamps
    end
  end
end

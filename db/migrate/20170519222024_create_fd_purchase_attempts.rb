class CreateFdPurchaseAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :fd_purchase_attempts do |t|
      t.references :user, foreign_key: true
      t.references :fixed_deposit_investment, foreign_key: true
      t.integer :principal_pesewas

      t.timestamps
    end
  end
end

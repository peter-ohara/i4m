class CreatePurchasedTBills < ActiveRecord::Migration[5.0]
  def change
    create_table :purchased_t_bills do |t|
      t.references :user, foreign_key: true
      t.integer :principal_pesewas
      t.integer :tenure
      t.references :bank_of_ghana_rate, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTBills < ActiveRecord::Migration[5.0]
  def change
    create_table :t_bills do |t|
      t.integer :principal
      t.integer :tenure
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

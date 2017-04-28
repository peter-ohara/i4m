class CreateNextOfKins < ActiveRecord::Migration[5.0]
  def change
    create_table :next_of_kins do |t|
      t.string :name
      t.string :phone_number
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

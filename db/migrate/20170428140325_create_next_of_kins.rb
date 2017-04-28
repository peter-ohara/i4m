class CreateNextOfKins < ActiveRecord::Migration[5.0]
  def change
    create_table :next_of_kins do |t|
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end

class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.integer :prefecture_id, null: false
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone_number, null: false
      t.integer :purchase_id, null: false, foreign_key: 
      t.timestamps
    end
  end
end

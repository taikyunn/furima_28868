class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|

      t.timestamps
      t.integer :prefecture_id, null: false
      t.string :postal_code, null: false
      t.string :city, null: false
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :postage_id, null: false
      t.integer :area_id, null: false
      t.integer :shipping_id, null: false
      t.timestamps
    end
  end
end

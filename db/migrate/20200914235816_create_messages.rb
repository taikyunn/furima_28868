class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.text :text
      t.integer :product_id, null: false
      t.timestamps
    end
  end
end

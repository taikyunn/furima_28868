class AddUserIdToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :user_id, :integer, null: false, foreign_key: true
    add_column :purchases, :item_id, :integer, null: false, foreign_key: true
  end
end

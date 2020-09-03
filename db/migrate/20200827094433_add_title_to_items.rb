class AddTitleToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :title, :string, null: false
    add_column :items, :introduction, :text, null: false
    add_column :items, :price, :integer, null: false
    add_column :items, :user_id, :integer, null: false, foreign_key: true
  end
end

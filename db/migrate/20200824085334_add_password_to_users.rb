class AddPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :string, null: false, default: ''
  end
end

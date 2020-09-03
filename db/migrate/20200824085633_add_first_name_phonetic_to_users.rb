class AddFirstNamePhoneticToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_phonetic, :string, null: false, default: ''
  end
end

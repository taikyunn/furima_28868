class AddFamilyNamePhoneticToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_phonetic, :string, null: false, default: ''
  end
end

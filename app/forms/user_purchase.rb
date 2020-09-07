class UserPurchase

  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :city, :address, :building, :phone_number, :purchase_id, :user_id

  with_options precense: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: less_than_or_equal_to: 11 }
    validates :purchase_id
  end

  def save
    user = User.create(nickname: nickname,email: email, password: password, first_name: first_name, family_name: family_name, first_name_phonetic: first_name_phonetic, family_name_phonetic: family_name_phonetic, birthday: birthday)
    Place.create(prefecture_id: prefecture_id, postal_code: postal_code, city: city, address: adress, building: building, phone_number: phone_number, purchase_id: prefecture_id)
    Purchase.create(purchase_id: purchase_id, user_id: user.id)
  end
  
end
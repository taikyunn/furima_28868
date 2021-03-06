class UserPurchase
  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :city, :address, :building, :phone_number, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は（ハイフン必須）で入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'は11桁以内の数字（ハイフン不要）で入力してください' }
    validates :purchase_id
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Place.create(prefecture_id: prefecture_id, postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end

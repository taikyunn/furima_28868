class UserPurchase

  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :city, :address, :building, :phone_number, :purchase_id, :user_id,:item_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number,numericality: {less_than_or_equal_to: 11}
    validates :purchase_id
    validates :purchase_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Place.create(prefecture_id: prefecture_id, postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
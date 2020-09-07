class Place < ApplicationRecord
  belongs_to :purchase

  with_options precense: true do
    validates :prefecture_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: less_than_or_equal_to: 11 }
    validates :purchase_id
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping
  belongs_to_active_hash :status

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :category_id
    validates :area_id
    validates :postage_id
    validates :shipping_id
    validates :status
    validates :title
    validates :introduction
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :user_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :area_id
    validates :postage_id
    validates :shipping_id
    validates :status_id
  end


end

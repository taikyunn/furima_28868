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
  has_many :messages
  has_many :favorites, dependent: :destroy 

  with_options presence: true do
    validates :category_id
    validates :area_id
    validates :postage_id
    validates :shipping_id
    validates :status_id
    validates :title
    validates :introduction
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999, message: 'は300円以上9,999,999円以下かつ半角で記入してください' }, format: { with: /\A[0-9]+\z/ }
    validates :user_id
    validates :image
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :area_id
    validates :postage_id
    validates :shipping_id
    validates :status_id
  end

  def self.search(search)
    if search != ''
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end

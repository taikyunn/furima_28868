class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  has_many :messages

  with_options presence: true do
    validates :password, format: { with: /[a-z\d]{6,}/i }
    validates :nickname
    validates :email, uniqueness: true
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'  }
    validates :birthday
    validates :first_name_phonetic, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力してください'  }
    validates :family_name_phonetic, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカタで入力してください'  }
  end
end
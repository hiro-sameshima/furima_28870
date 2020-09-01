class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }

  with_options presence: true do
    validates :name
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end
end

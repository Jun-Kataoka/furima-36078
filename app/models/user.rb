class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :encrypted_password, :password, :password_confirmation, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, allow_blank: true, message: "is invalid. Input must contain both alphameric and numeric characters."}
  validates :nickname, :birthday,                      presence: true
  validates :family_name, :first_name,                 presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true, message: "is invalid. Input full-width characters."}
  validates :family_name_reading, :first_name_reading, presence: true, format: {with: /\A[ァ-ヶー]+\z/, allow_blank: true, message: "is invalid. Input full-width katakana characters."}

  has_many :items
  has_many :orders
end

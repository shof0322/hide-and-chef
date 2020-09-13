class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chefs

  regexp_name = /\A[ぁ-んァ-ン一-龥]/
  regexp_name_kana = /\A[ァ-ヶー－]+\z/
  regexp_password = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,100}+\z/

  with_options presence: true do
    validates :nickname, :birthday
    validates :email, uniqueness: true
    validates :first_name, :last_name, format: { with: regexp_name }
    validates :first_name_read, :last_name_read, format: { with: regexp_name_kana }
    validates :password, format: { with: regexp_password }
  end
end

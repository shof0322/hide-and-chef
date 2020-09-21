class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chefs
  has_one :card, dependent: :destroy

  regexp_name = /\A[ぁ-んァ-ン一-龥]/
  regexp_name_read = /\A[ァ-ヶー－]+\z/
  regexp_password = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,100}+\z/

  with_options presence: true do
    validates :nickname, :birthday
    validates :email, uniqueness: true
    validates :first_name, :last_name, format: { with: regexp_name }
    validates :first_name_read, :last_name_read, format: { with: regexp_name_read }
    validates :password, format: { with: regexp_password }, on: :create
  end
end

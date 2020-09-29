class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :chefs
  has_many :orders, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :sns_credentials

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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end

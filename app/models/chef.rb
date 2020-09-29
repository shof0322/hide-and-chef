class Chef < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  
  has_one_attached :image
  belongs_to :user
  has_one :course, dependent: :destroy

  with_options presence: true do
    validates :image, :name, :explanation, :commitment, :city, :address
    validates :user_id, uniqueness: true
    validates :prefecture_id, :category_id, numericality: { other_than: 1 }
    validates :phone_num, format: { with: /\A\d{11}\z/ }
  end
end


class Chef < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image, :name, :explanation, :commitment, :city, :address, :user_id
    validates :prefecture_id, :category_id, numericality: { other_than: 1 }
    validates :phone_num, format: { with: /\A\d{11}\z/ }
    end

end

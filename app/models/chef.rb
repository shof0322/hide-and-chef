class Chef < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category

  belongs_to :user

  with_options presence: true do
    validates :name, :explanation, :commitment, :city, :address, :user_id
    validates :prefecture_id, :category_id, numericality: { other_than: 1 }
    validates :phone_num, format: { with: /\A\d{11}\z/ }
    end

end

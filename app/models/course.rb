class Course < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  has_many_attached :images
  belongs_to :chef

  with_options presence: true do
    validates :menu1, :menu2, :menu3, :explanation, :chef_id
    validates :category_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_99 }
    validates :price, format: { with: /\A[0-9]+\z/ }
  end
end

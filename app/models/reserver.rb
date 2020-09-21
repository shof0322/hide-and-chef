class Reserver < ApplicationRecord
  belongs_to :order
  
  with_options presence: true do
    validates :city, :address, :reserve_date, :reserve_time
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_num, format: { with: /\A\d{11}\z/ }  
  end
end

class OrderReserver
  include ActiveModel::Model
  attr_accessor :user_id, :course_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_num, :reserve_date, :reserve_time

  with_options presence: true do
    validates :user_id, :course_id, :city, :address, :reserve_date, :reserve_time
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_num, format: { with: /\A\d{11}\z/ }  
  end

  def save
    order = Order.create(user_id: user_id, course_id: course_id)
    Reserver.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, reserve_date: reserve_date, reserve_time: reserve_time, order_id: order.id)
  end
end
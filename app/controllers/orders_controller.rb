class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :course_id)
  end
end

class OrdersController < ApplicationController
  def new
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
    
    @chef = Chef.find(params[:format])
    @order = OrderReserver.new
  end

  def create
    @chef = Chef.find(params[:format])
    @order = OrderReserver.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private

  def order_params
    params.require(:order_reserver).permit(:user_id, :course_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_num, :reserve_date, :reserve_time).merge(user_id: current_user.id, course_id: @chef.course.id)
  end
end

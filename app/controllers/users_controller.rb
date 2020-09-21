class UsersController < ApplicationController
  
  def show
    @user = User.find(current_user.id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

end

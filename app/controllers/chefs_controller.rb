class ChefsController < ApplicationController
  def index
    
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :explanation, :category_id, :commitment, :prefecture_id, :city, :address, :building, :phone_num, :target_amount, :target_return).merge(user_id: current_user.id)
  end
end

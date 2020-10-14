class ChefsController < ApplicationController
  def index
    @chefs = Chef.includes(:user)
  end

  def new
    @chef = Chef.includes(:user)
    if @chef.exists?(user_id: current_user.id)
      redirect_to root_path
    else
      @chef = Chef.new
    end
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @chef = Chef.find_by(user_id: params[:id])
    if @chef.nil?
      redirect_to new_chef_path
    else
      @gmap_api_src = "https://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_MAP_API']}&callback=initMap"
      @address = @chef.return_address
      render :show
    end
  end

  def destroy
    chef = Chef.find_by(user_id: params[:id])
    if chef.destroy
      render :destroy
    else
      render :show
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:image, :name, :explanation, :category_id, :commitment, :prefecture_id, :city, :address, :building, :phone_num, :target_amount, :target_return).merge(user_id: current_user.id)
  end
end

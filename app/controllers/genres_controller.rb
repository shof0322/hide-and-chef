class GenresController < ApplicationController
  def index
    @courses = Course.where(category_id: params[:category_id])
    if @courses.exists?  
    else
      redirect_to root_path
    end
  end
end

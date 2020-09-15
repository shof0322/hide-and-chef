class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    course = Course.find_by(chef_id: params[:chef_id])
  end

  def destroy
    course = Course.find_by(chef_id: params[:chef_id])
    if course.destroy
      redirect_to root_path
    else
      render 'destroy'
    end
  end


  private
  
  def course_params
    params.require(:course).permit(:menu1, :menu2, :menu3, :explanation, :category_id, :price, images: []).merge(chef_id: params[:chef_id])
  end
end

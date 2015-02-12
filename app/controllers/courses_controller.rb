class CoursesController < ApplicationController

def index
    @courses = Course.all
  end

  def show
    set_course
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create course_params
    if @course.save
      flash[:notice] = "#{@course.name} course successfully saved."
      redirect_to courses_path
    else
      flash[:alert] = "#Course NOT successfully saved."
      render :new
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:notice] = "#{@course.name} successfully updated."
    redirect_to courses_path
    else
      flash[:alert] = "#{@course.name} NOT successfully updated."
      render :edit
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.delete
    flash[:notice] = "Course successfully deleted."
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find params[:id]
  end

  def course_params
    params.require(:course).permit(
      :name,
      :description,
      location_ids: []
      )
  end

end

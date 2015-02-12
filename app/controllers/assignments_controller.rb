class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all
  end

  def show
    set_assignment
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create assignment_params
    if @assignment.save
      flash[:notice] = "#{@assignment.name} assignment successfully saved."
      redirect_to assignments_path
    else
      flash[:alert] = "#Assignment NOT successfully saved."
      render :new
    end
  end

  def edit
    @assignment = Assignment.find params[:id]
  end

  def update
    @assignment = Assignment.find params[:id]
    if @assignment.update_attributes assignment_params
      flash[:notice] = "#{@assignment.name} successfully updated."
    redirect_to assignments_path
    else
      flash[:alert] = "#{@assignment.name} NOT successfully updated."
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find params[:id]
    @assignment.delete
    flash[:notice] = "Assignment successfully deleted."
    redirect_to assignments_path
  end

  private

  def set_assignment
    @assignment = Assignment.find params[:id]
  end

  def assignment_params
    params.require(:assignment).permit(
      :name,
      :requirements,
      :user_id
      )
  end

end
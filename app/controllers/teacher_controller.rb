class TeacherController < ApplicationController
  def index
    @teacher = Instructor.find(params[:TID])
  end
  def create
    if params[:instructor][:major] == "" or params[:instructor][:instructor_name] == "" or params[:instructor][:TID] =~ /Please select/
      flash[:notice] = "ERROR"
    else
      @teacher = Instructor.create!(params[:instructor])
      flash[:notice] = "#{@teacher.instructor_name} was successfully created."
    end
    redirect_to "/course/add"
  end
  def add
    @users = User.all
  end
  def all
    @teacher = Instructor.all
  end
  def destroy
    @teacher = Instructor.find(params[:id])
    @teacher.destroy
    flash[:notice] = "Instructor '#{@teacher.instructor_name}' deleted."
    redirect_to "/teacher/all"
  end
end

class TeacherController < ApplicationController
  def index
    @teacher = Instructor.find(params[:TID])
  end
  def create
    @teacher = Instructor.create!(params[:instructor])
    flash[:notice] = "#{@teacher.TID} was successfully created."
    redirect_to "/course/add"
  end
  def add
  end
  def all
    @teacher = Instructor.all
  end
  def destroy
    @teacher = Instructor.find(params[:id])
    @teacher.destroy
    flash[:notice] = "Course '#{@teacher.instructor_name}'/'#{@teacher.id}' deleted."
    redirect_to "/teacher/all"
  end
end

class CourseController < ApplicationController
  def index
    @courses = Course.all
  end
  def add
    @teacher = Instructor.all
  end
  def create
    @course = Course.create!(params[:course])
    flash[:notice] = "#{@course.SID} was successfully created."
    redirect_to "/"
  end
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course '#{@course.name}'/'#{@course.id}' deleted."
    redirect_to "/"
  end
  
end

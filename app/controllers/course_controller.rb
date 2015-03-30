class CourseController < ApplicationController
  def index
    @courses = Course.all
  end
  def add
    @teacher = Instructor.all
  end
  def create
    flash[:notice] = "In create!"
    if params[:course][:semester] =~ /Please select/ or params[:course][:SID] == "" or params[:course][:name] == "" 
      flash[:notice] = "ERROR"
    else
      @course = Course.create!(params[:course])
      flash[:notice] = "#{@course.SID} was successfully created."
    end
    redirect_to "/course/index"
  end
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course '#{@course.SID}' deleted."
    redirect_to "/course/index"
  end
  def information
    @course = Course.find(params[:id])
    @teacher = Instructor.find(@course.TID)
  end
end
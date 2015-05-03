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
  def update
    if params[:course][:semester] =~ /Please select/ or params[:course][:SID] == "" or params[:course][:name] == "" 
      @course = Course.find(params[:id])
      flash[:notice] = "ERROR"
    else
      @course = Course.find(params[:id])
      @course.name = params[:course][:name]
      @course.save
      @teacher = Instructor.all
      flash[:notice] = "#{@course.SID} was successfully edited."
    end
    redirect_to "/course/information/#{@course.id}"
  end
  def edit
    @course = Course.find(params[:id])
    @teacher = Instructor.all
  end
  def search
    if params[:name]
      @courses = Course.where("#{params[:by]} = ?", params[:name])
      @found = Course.where("#{params[:by]} = ?", params[:name]).count
      @by = params[:by]
      @seachBox = params[:name]
    else
      @by = 'SID'
      @seachBox = ''
      @found = 0
    end
  end
  def menu
  end

end
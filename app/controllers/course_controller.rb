class CourseController < ApplicationController
  def index
    @courses = Course.all
    @admin =nil
  end
  def add
    if session[:uid] == nil
      redirect_to "/user/login"
    end
    @teacher = Instructor.all
  end
  def create
    flash[:notice] = "In create!"
    if params[:course][:semester] =~ /Please select/ or params[:course][:SID] == "" or params[:course][:name] == "" 
      flash[:notice] = "ERROR"
    else
      @course = Course.create!(params[:course])
      params[:schedule][:course_id] = @course.id
      @schedule = Schedule.create!(params[:schedule])
      study = {:course_id => @course.id,:user_id => @course.TID}
      @study = Study.create!(study)
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
    @teacher = Instructor.where("id = ?",@course.TID).first
    @schedule = Schedule.where("course_id = ?",params[:id]).first
  end
  def update
    if params[:course][:semester] =~ /Please select/ or params[:course][:SID] == "" or params[:course][:name] == "" 
      @course = Course.find(params[:id])
      flash[:notice] = "ERROR"
    else
      @course = Course.find(params[:id])
      @course.name = params[:course][:name]
      @course.TID = params[:course][:TID]
      @course.SID = params[:course][:SID]
      @course.semester = params[:course][:semester]
      @course.about = params[:course][:about]
      @course.section = params[:course][:section]
      @course.curriculum = params[:course][:curriculum]
      @course.available = params[:course][:available]
      @course.save
      
      @schedule = Schedule.where("course_id = ?",params[:id]).first
      @schedule.course_id = params[:id]
      @schedule.day = params[:schedule][:day]
      @schedule.start_hr = params[:schedule][:start_hr]
      @schedule.start_min = params[:schedule][:start_min]
      @schedule.duration = params[:schedule][:duration]
      @schedule.save
      @teacher = Instructor.all
      flash[:notice] = "#{@course.SID} was successfully edited."
    end
    redirect_to "/course/information/#{@course.id}"
  end
  def edit
    @course = Course.find(params[:id])
    @teacher = Instructor.all
    @schedule = Schedule.where("course_id = ?",params[:id]).first
  end
  def search
    if params[:name]
      @courses = Course.where("#{params[:by]} = ?", params[:name])
      @found = Course.where("#{params[:by]} = ?", params[:name]).count
      @by = params[:by]
      @seachBox = params[:name]
      if session[:uid] 
        @user = User.find(session[:uid])
        if @user.uname == 'admin'
          @admin = true
        end
      end
    else
      @by = 'SID'
      @seachBox = ''
      @found = -1
      @admin =nil
      if session[:uid] 
        @user = User.find(session[:uid])
        if @user.uname == 'admin'
          @admin = true
        end
      end
    end
  end
  def menu
  end

end
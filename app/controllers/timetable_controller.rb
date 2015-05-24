class TimetableController < ApplicationController
  def index
    if session[:uid] == nil
      redirect_to "/user/login"
    end
    @users = User.all
    @courses = Course.all
    @schedules = Schedule.all
    @study = Study.all
  end
  def view
    @day = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    if params[:id] =~ /Please select/
      flash[:notice] = "ERROR Please select"
      redirect_to "/timetable/index"
    else
      @find = User.find(params[:id])
      @courses = Course.find_by_sql("SELECT SID,start_hr,start_min,day,duration,courses.name 
      FROM courses,studies,schedules WHERE studies.user_id = #{params[:id]} AND 
      studies.course_id = courses.id AND courses.id=schedules.course_id")
      
      @course_monday = Course.find_by_sql("SELECT * FROM courses,studies,schedules
      WHERE studies.user_id = #{params[:id]} AND studies.course_id = courses.id AND
      courses.id=schedules.course_id AND schedules.day = 1 ORDER BY start_hr,start_min")
      
      @course_tuesday = Course.find_by_sql("SELECT * FROM courses,studies,schedules
      WHERE studies.user_id = #{params[:id]} AND studies.course_id = courses.id AND
      courses.id=schedules.course_id AND schedules.day = 2 ORDER BY start_hr,start_min")
      
      @course_wednesday = Course.find_by_sql("SELECT * FROM courses,studies,schedules
      WHERE studies.user_id = #{params[:id]} AND studies.course_id = courses.id AND
      courses.id=schedules.course_id AND schedules.day = 3 ORDER BY start_hr,start_min")
      
      @course_thursday = Course.find_by_sql("SELECT * FROM courses,studies,schedules
      WHERE studies.user_id = #{params[:id]} AND studies.course_id = courses.id AND
      courses.id=schedules.course_id AND schedules.day = 4 ORDER BY start_hr,start_min")
      
      @course_friday = Course.find_by_sql("SELECT * FROM courses,studies,schedules
      WHERE studies.user_id = #{params[:id]} AND studies.course_id = courses.id AND
      courses.id=schedules.course_id AND schedules.day = 5 ORDER BY start_hr,start_min")
    end
  end
  def regis
    flash[:notice] = "In regis!"
    if params[:study][:user_id] =~ /Please select/ or params[:study][:course_id] =~ /Please select/
      flash[:notice] = "ERROR Please select"
    else
      @study = Study.create!(params[:study])
      @course = Course.find(@study.course_id)
      flash[:notice] = "#{session[:uname]} registered #{@course.SID}."
    end
    redirect_to "/timetable/index"
  end
end
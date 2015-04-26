class TimetableController < ApplicationController
  def index
    @users = User.all
    @courses = Course.all
  end
  def view
    @users = User.all
    if params[:id] =~ /Please select/
      flash[:notice] = "ERROR Please select"
      redirect_to "/timetable/index"
    else
      @find = User.find(params[:id])
      @courses = Course.find_by_sql("SELECT * FROM courses,studies
      WHERE studies.user_id = #{params[:id]} AND studies.course_id = courses.id")
    end
  end
  def regis
    flash[:notice] = "In regis!"
    if params[:study][:user_id] =~ /Please select/ or params[:study][:course_id] =~ /Please select/
      flash[:notice] = "ERROR Please select"
    else
      @study = Study.create!(params[:study])
      flash[:notice] = "#{@study.course_id}  #{@study.user_id} was successfully created."
    end
    redirect_to "/timetable/index"
  end
end
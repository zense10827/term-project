class UserController < ApplicationController
  def index
    @users = User.all
  end
  def add
  end
  def create
    flash[:notice] = "In create!"
    if params[:user][:uname] == "" or params[:user][:password] == ""
      flash[:notice] = "ERROR"
    else
      @user = User.create!(params[:user])
      flash[:notice] = "#{@user.uname} was successfully created."
    end
    redirect_to "/user/login"
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.uname}' deleted."
    redirect_to "/user/login"
  end
  def login
    if session[:uid] != nil
      redirect_to "/timetable/index"
    end
    if params[:uname] == "" and params[:password] == ""
     flash[:notice] = "Invalid username or password"
    else 
      @user = User.where("uname = ? AND password = ?",params[:uname],params[:password]).first
      if @user
        flash[:notice] = "Welcome #{@user.uname}"
        session[:uid] = @user.id
        redirect_to "/timetable/index"
      else
        if params[:uname] and params[:password]
          flash[:notice] = "Invalid username or password"
        else
          flash[:notice] = "Please Login"
        end
      end
    end
  end
  def logout
    reset_session
    redirect_to "/user/login"
  end
end

class UserController < ApplicationController
  def index
    if session[:uid] == nil
      redirect_to "/user/login"
    end
    @users = User.all
  end
  def add
  end
  def create
    if params[:user][:uname] == '' or params[:user][:password] == ''
      flash[:notice] = 'ERROR empty input'
      redirect_to "/user/add"
    else
      has_admin = User.where('uname = \'admin\'').count
      if has_admin == 1 and params[:user][:uname] == 'admin'
        flash[:notice] = 'ERROR try to sign up as admin'
        redirect_to "/user/add"
      else
        @user = User.create!(params[:user])
        flash[:success] = "#{@user.uname} was successfully created."
        redirect_to "/timetable/index"
      end
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User '#{@user.uname}' deleted."
    if (params[:id] == session[:uid])
      reset_session
    end
    redirect_to "/user/index"
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
        session[:uname] = @user.uname
        redirect_to "/timetable/index"
      else
        if params[:uname] and params[:password]
          flash[:notice] = "Invalid username or password"
        else
          flash[:notice] = ""
        end
      end
    end
  end
  def logout
    reset_session
    redirect_to "/user/login"
  end
end

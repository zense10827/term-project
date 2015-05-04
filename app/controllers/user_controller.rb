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
      flash[:notice] = "#{@user.id} #{@user.uname} was successfully created."
    end
    redirect_to "/user/index"
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.uname}' deleted."
    redirect_to "/user/index"
  end
  def login
    @username = params[:uname]
    @password = params[:password]
  end
end

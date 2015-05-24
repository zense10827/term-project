require 'rails_helper'
require 'spec_helper'

RSpec.describe TeacherController, :type => :controller do
  describe 'index' do
    it 'show all Instructor' do
      session[:uid]="15"
      session[:uname]="admin"
      get :all
      response.should render_template('all')
      #list Instructor should recive find all
    end
    it 'show all Instructor without login (Sad path)' do
      get :all
      response.should redirect_to "/user/login"
      #without login go to login page
    end
    before(:each) do
      post :create, :instructor => {:TID=>"13",:instructor_name=>"Mook Cat",:major=>"CN"}
    end
    it 'should redirect when see detail of teacher without login' do
      session[:uid]=nil
      get :index, :TID => '1'
      response.should redirect_to '/user/login'
    end
    it 'should show detail of teacher' do
      session[:uid]="15"
      session[:uname]="admin"
      get :index, :TID => '1'
      response.should render_template('index')
    end
  end
  describe 'create' do
    it 'should redirect_to user/login when try to add user without login' do
      session[:uid]=nil
      get :add
      response.should redirect_to "/user/login"
    end
    before(:each) do
      session[:uid]="15"
      session[:uname]="admin"
    end
    it 'should add a new Instructor' do
      expect do
        post :create, :instructor => {:TID=>"13",:instructor_name=>"Mook Cat",:major=>"CN"}
      end.to change(Instructor,:count).by(1) 
    end
    it "redirects to the new contact" do 
      post :create, :instructor => {:TID=>"13",:instructor_name=>"Mook Cat",:major=>"CN"}
      response.should redirect_to "/course/add"
    end
    it 'should not add a new Instructor no TID' do
      expect do
        post :create, :instructor => {:TID=>"",:instructor_name=>"Mook Cat",:major=>"CN"}
      end.to change(Instructor,:count).by(0) 
    end
    it 'should not add a new Instructor no name' do
      expect do
        post :create, :instructor => {:TID=>"13",:instructor_name=>"",:major=>"CN"}
      end.to change(Instructor,:count).by(0) 
    end
    it 'should not add a new Instructor no major' do
      expect do
        post :create, :instructor => {:TID=>"13",:instructor_name=>"Mook Cat",:major=>""}
      end.to change(Instructor,:count).by(0) 
    end
  end
  

	describe 'DELETE destroy' do 
    it "deletes the Instructor" do 
      article = Instructor.create!(:TID=>"13")
      expect do
        delete :destroy, {:id => article.to_param}
      end.to change(Instructor, :count).by(-1)
    end 
    it "redirects to contacts#index" do 
      article = Instructor.create!(:TID=>"13")
      delete :destroy, {:id => article.to_param}
      response.should redirect_to "/teacher/all"
    end
  end
end

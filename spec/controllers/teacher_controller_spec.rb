require 'rails_helper'
require 'spec_helper'

RSpec.describe TeacherController, :type => :controller do
  
  describe 'index' do
    it 'show all Instructor' do
      get :all
      response.should render_template('all')
      #list Instructor should recive find all
    end
  end
  describe 'create' do
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

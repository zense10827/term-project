require 'rails_helper'
require 'spec_helper'

RSpec.describe CourseController, :type => :controller do
  
  describe 'index' do
    it 'show all course' do
      get :index
      response.should render_template('index')
      #list course should recive find all
    end
  end
  describe 'create' do
    before(:each) do
      session[:uid]="15"
      session[:uname]="admin"
    end
    it 'should add a new course' do
      expect do
        param = { 
          :course => {:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"},
          :schedule => {:day=>"1",:start_hr=>"9",:start_min=>"0"}
        }
        post :create, param
      end.to change(Course,:count).by(1) 
    end
    it "redirects to the new course" do 
      param = { 
          :course => {:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"},
          :schedule => {:day=>"1",:start_hr=>"9",:start_min=>"0"}
      }
      post :create, param
      response.should redirect_to "/course/index"
    end
    
    it 'should not add a new course no SID' do
      expect do
        post :create, :course => {:SID=>"",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"}
      end.to change(Course,:count).by(0) 
    end
    it 'should not add a new course no name' do
      expect do
        post :create, :course => {:SID=>"CN555",:TID=>"13",:name=>"",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"}
      end.to change(Course,:count).by(0) 
    end
    it 'should not add a new course dose not select semester' do
      expect do
        post :create, :course => {:SID=>"CN555",:TID=>"13",:name=>"",:section=>"54321",:semester=>"Please select",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"}
      end.to change(Course,:count).by(0) 
    end
  end
  
  describe 'information' do
    it 'should be see all detail' do
      teacher = Instructor.create!( {:TID=>"13",:instructor_name=>"Mook Cat",:major=>"CN"})
      article = Course.create!({:SID=>"CN555",:TID=>"#{teacher.to_param}",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"})
      post :information, {:id => article.to_param}
      response.should render_template('information')
    end
  end
  
  describe 'edit and update' do
    before(:each) do
      session[:uid]="15"
      session[:uname]="admin"
    end
    it 'should be render a edit page' do
      teacher = Instructor.create!( {:TID=>"13",:instructor_name=>"Mook Cat",:major=>"CN"})
      article = Course.create!({:SID=>"CN555",:TID=>"#{teacher.to_param}",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"})
      study = Schedule.create!({:course_id=>"#{article.id}",:day=>"2",:start_min=>"0",:start_hr=>"9",:duration=>"60"})
      post :edit, {:id => article.to_param}
      response.should render_template('edit')
    end
    
    before(:each) do
      @article = Course.create!({:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"})
      @schedule = Schedule.create!({:course_id=>"#{@article.id}",:day=>"1",:start_hr=>"9",:start_min=>"0"})
      param = { 
          :course => {:SID=>"CN555",:TID=>"13",:name=>"Test Update",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"},
          :schedule => {:day=>"1",:start_hr=>"9",:start_min=>"0"},
          :id => @article.id
      }
      put :update, param
      @article.reload
    end
    it { expect(response).to redirect_to("/course/information/#{@article.id}") }
    it { expect(@article.name).to eql "Test Update" }
  end
  
  describe 'edit and update (SAD: No SID)' do
    let(:attr) do 
      {:SID=>"",:TID=>"13",:name=>"New name of Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"}
      
    end
    before(:each) do
      @article = Course.create!({:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"})
      put :update, :id => @article.id, :course => attr
      @article.reload
    end
    it { expect(response).to redirect_to("/course/information/#{@article.id}") }
    it { expect(@article.SID).to eql "CN555" }
  end

  describe 'search' do
    before(:each) do
      @article = Course.create!({:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"})
    end
    it 'should return results when search by Sudject ID' do
      get :search, { :by=>"SID", :name=>"CN555" }
      response.should be_ok
    end
    it 'should return results when search by Subject name' do
      get :search, { :by=>"name", :name=>"Test Controller" }
      response.should be_ok
    end
    it 'should not found' do
      get :search, { :by=>"name", :name=>"Can You Find Me" }
      expect(@course).to eql nil;
    end
  end
  
	describe 'DELETE destroy' do 
    it "deletes the subject" do 
      article = Course.create!(:SID=>"CN555")
      expect do
        delete :destroy, {:id => article.to_param}
      end.to change(Course, :count).by(-1)
    end 
    it "redirects to contacts#index" do 
      article = Course.create!(:SID=>"CN555")
      delete :destroy, {:id => article.to_param}
      response.should redirect_to "/course/index"
    end
  end
  describe 'about' do
    it 'should be render about' do
      get :about
      expect(response).to render_template('about')
    end
  end
end

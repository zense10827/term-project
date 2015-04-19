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
    it 'should add a new course' do
      expect do
        post :create, :course => {:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"}
      end.to change(Course,:count).by(1) 
    end
    it "redirects to the new contact" do 
      post :create, :course => {:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"}
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
    it 'should be render a edit page' do
      teacher = Instructor.create!( {:TID=>"13",:instructor_name=>"Mook Cat",:major=>"CN"})
      article = Course.create!({:SID=>"CN555",:TID=>"#{teacher.to_param}",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"})
      post :edit, {:id => article.to_param}
      response.should render_template('edit')
    end
    let(:attr) do 
      {:SID=>"CN555",:TID=>"13",:name=>"New name of Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"}
    end
    before(:each) do
      @article = Course.create!({:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"})
      put :update, :id => @article.id, :course => attr
      @article.reload
    end
    it { expect(response).to redirect_to("/course/information/#{@article.id}") }
    it { expect(@article.name).to eql attr[:name] }
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
end

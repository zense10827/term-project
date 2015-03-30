require 'rails_helper'
require 'spec_helper'
RSpec.describe CourseController, :type => :controller do

  describe 'create' do
    it 'should add a new course' do
      post create
      flash[:notice].should_not be_nil
    end
  end
  describe 'index'
    it 'show all course' do
      get :index
      response.should render_template('index')
    end
  end
  describe 'destroy' do
    it 'should destroy a course' do
      m = mock(Course, :id => "10")
      Course.stub!(:find).with("10").and_return(m)
      m.should_receive(:destroy)
      delete :destroy, {:id => "10"}
    end
  end

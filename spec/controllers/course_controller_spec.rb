require 'rails_helper'
require 'spec_helper'

RSpec.describe CourseController, :type => :controller do
  
  describe 'index' do
    it 'show all course' do
      get :index
      response.should render_template('index')
    end
  end
  
  describe 'create' do
    it 'should add a new course' do
      post :create, {:id => "1"}
      flash[:notice].should_not be_nil
    end
  end
  
  describe 'destroy' do
		it 'should destroy a movie' do
      m = mock(Course, :id => "10")
      Course.stub!(:find).with("10").and_return(m)
      m.should_receive(:destroy)
      delete :destroy, {:id => "10"}
    end
	end
  
end
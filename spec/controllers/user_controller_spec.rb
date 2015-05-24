require 'rails_helper'
require 'spec_helper'

RSpec.describe UserController, :type => :controller do
  describe 'get User#index' do
    it 'show all User' do
      session[:uid]="15"
      session[:uname]="admin"
      get :index
      response.should render_template('index')
      #list all user if login
    end
    it 'show login page when go to index without login (Sad path)' do
      get :index
      response.should redirect_to "/user/login"
      #without login go to login page
    end
  end
  describe 'sign up' do
    it 'should be sign up a new user' do
      expect do
        param = {:user => {:uname=>'tester',:password=>'1234'}}
        post :create, param
      end.to change(User, :count).by(1)
    end
    it 'should be sign up a new admin on first time' do
      expect do
        param = {:user => {:uname=>'admin',:password=>'1234'}}
        post :create, param
      end.to change(User, :count).by(1)
    end
    it 'should not be sign up a new admin' do
      param = {:user => {:uname=>'admin',:password=>'1234'}}
      post :create, param
      expect do
        param = {:user => {:uname=>'admin',:password=>'asdf'}}
        post :create, param
      end.to change(User, :count).by(0)
    end
    it 'should not be sign up with no uname' do
      expect do
        param = {:user => {:uname=>'',:password=>'1234'}}
        post :create, param
      end.to change(User, :count).by(0)
    end
  end
  describe 'login and logout' do
    before(:each) do
      param = {:user => {:uname=>'tester',:password=>'1234'}}
      post :create, param
    end
    it 'should be login' do 
      param = {:uname=>'tester',:password=>'1234'}
      post :login, param
      session[:uname].should == 'tester'
    end
    it 'should logout after login' do
      param = {:uname=>'tester',:password=>'1234'}
      post :login, param
      get :logout
      session[:uname].should == nil
    end
  end
end
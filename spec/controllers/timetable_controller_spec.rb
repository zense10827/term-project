require 'rails_helper'

RSpec.describe TimetableController, :type => :controller do
  describe "GET #index" do
    it "returns http success when login" do
      session[:uid]="15"
      session[:uname]="admin"
      get :index
      expect(response).to have_http_status(:success)
    end
    it "redirect_to login page if not login" do
      get :index
      expect(response).to redirect_to '/user/login'
    end
  end
  describe 'regis' do 
    it 'should not be register any course' do
      expect do
        param = {:study => {:user_id=>'2',:course_id=>'Please select'}}
        post :regis, param
      end.to change(Study, :count).by(0)
    end
  end
end

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'TimetableTesting', :type => :request do
  describe 'regis the course' do 
    it 'should be register a course' do
      param = { 
        :course => {:SID=>"CN555",:TID=>"13",:name=>"Test Controller",:section=>"54321",:semester=>"2",:curriculum=>"2554",:about=>"Test Rspec",:available=>"Yes"},
        :schedule => {:day=>"1",:start_hr=>"9",:start_min=>"0"}
      }
      post "/course/create", param
      expect do
        param = {:study => {:user_id=>'1',:course_id=>'1'}}
        post "/timetable/regis", param
      end.to change(Study, :count).by(1)
    end
  end
  describe 'view' do
    it 'should be see time table' do
      param = {:user => {:uname=>'admin',:password=>'1234'}}
      post "/user/create", param
      post "/timetable/view", :id => 1
      expect(response).to render_template('timetable/view')
    end
  end
end

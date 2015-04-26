class Schedule < ActiveRecord::Base
  attr_accessible :course_id, :day, :duration, :start_hr, :start_min
end

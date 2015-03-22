class Course < ActiveRecord::Base
  attr_accessible :SID, :TID, :about, :available, :curriculum, :name, :section, :semester
end

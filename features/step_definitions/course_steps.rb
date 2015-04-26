Given /the following course exist/ do |course_table|
  course_table.hashes.each do |course|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Course.create course  
  end
end

Given /the following instructor exist/ do |instructor_table|
  instructor_table.hashes.each do |instructor|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Instructor.create instructor  
  end
end

Given /the following user exist/ do |user_table|
  user_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create user 
  end
end
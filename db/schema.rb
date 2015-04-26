# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150426185819) do

  create_table "courses", :force => true do |t|
    t.integer  "TID"
    t.string   "SID"
    t.string   "name"
    t.string   "semester"
    t.text     "about"
    t.integer  "section"
    t.string   "curriculum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "available"
  end

  create_table "instructors", :force => true do |t|
    t.integer  "TID"
    t.string   "instructor_name"
    t.string   "major"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "course_id"
    t.integer  "day"
    t.integer  "start_hr"
    t.integer  "start_min"
    t.integer  "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "studies", :force => true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "uname"
    t.text     "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

class AddUserDb < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uname
      t.string :password
      t.timestamps
    end
    create_table :schedules do |t|
      t.string :course_id
      t.string :day
      t.string :start_hr
      t.string :start_min
      t.timestamps
    end
    create_table :study do |t|
      t.integer :course_id
      t.integer :user_id
      t.timestamps
    end
  end

end

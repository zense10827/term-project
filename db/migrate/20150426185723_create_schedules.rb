class CreateSchedules < ActiveRecord::Migration
  def change
    drop_table :schedules
    create_table :schedules do |t|
      t.integer :course_id
      t.integer :day
      t.integer :start_hr
      t.integer :start_min
      t.integer :duration

      t.timestamps
    end
  end
end

class AddDurationToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :duration, :integer
  end
end

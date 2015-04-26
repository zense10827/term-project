class CreateStudies < ActiveRecord::Migration
  def change
    drop_table :study
    create_table :studies do |t|
      t.integer :course_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.integer :TID
      t.string :instructor_name
      t.string :major

      t.timestamps
    end
  end
end

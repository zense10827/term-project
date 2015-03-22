class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :TID
      t.string :SID
      t.string :name
      t.string :semester
      t.text :about
      t.integer :section
      t.string :curriculum
      t.boolean :available

      t.timestamps
    end
  end
end

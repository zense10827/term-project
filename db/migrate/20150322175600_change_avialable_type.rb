class ChangeAvialableType < ActiveRecord::Migration
  def up
    remove_column :courses, :available
    add_column :courses, :available, :string
  end

  def down
  end
end

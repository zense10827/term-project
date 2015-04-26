class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :uname
      t.text :password

      t.timestamps
    end
  end
end

class AddArieToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :p, :string
    add_column :tasks, :c, :string
    add_column :tasks, :a, :string
  end
end

class AddDeadlineFromTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :deadline, :string
  end
end

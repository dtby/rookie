class RemoveDeadlineFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :deadline, :datetime
  end
end

class AddAppliesCountToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :applies_count, :integer
  end
end

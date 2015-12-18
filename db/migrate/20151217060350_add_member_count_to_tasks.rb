class AddMemberCountToTasks < ActiveRecord::Migration
  def change
  	remove_column :users, :constellation, :integer
    add_column :tasks, :member_count, :integer
  end
end

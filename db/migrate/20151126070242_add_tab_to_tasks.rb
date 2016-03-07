class AddTabToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :tab, :string
  end
end

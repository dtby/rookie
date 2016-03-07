class ChangeDefaultOfTasksState < ActiveRecord::Migration
  def change
  	reversible do |dir|
      change_table :tasks do |t|
        dir.up   { t.change :state, :integer, default: 3 }
        dir.down { t.change :state, :integer }
      end
    end
  end
end

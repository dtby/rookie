class ChangeStateOfApplies < ActiveRecord::Migration
  def change
  	reversible do |dir|
      change_table :applies do |t|
        dir.up   { t.change :state, :integer, default: 2 }
        dir.down { t.change :state, :boolean }
      end
    end
  end
end

class AddStateToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :state, :bool
  end
end

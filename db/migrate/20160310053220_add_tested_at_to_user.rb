class AddTestedAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :tested_at, :datetime
  end
end

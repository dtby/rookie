class AddConstellationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :constellation, :integer
  end
end

class AddOpenIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :open_id, :string
  end
end

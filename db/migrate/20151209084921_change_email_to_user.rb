class ChangeEmailToUser < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: true, default: ""
    remove_index :users, :email
  end
end

class RenameMobileForMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :mobile, :phone
  end
end

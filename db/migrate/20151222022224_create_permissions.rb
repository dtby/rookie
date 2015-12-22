class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :role
      t.boolean :boss
      t.integer :grade
      t.boolean :money
      t.integer :release
      t.integer :receive_per_month
      t.integer :meanwhile

      t.timestamps null: false
    end
  end
end

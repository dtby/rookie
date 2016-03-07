class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

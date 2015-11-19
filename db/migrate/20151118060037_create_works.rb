class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :company
      t.date :start_time
      t.date :end_time
      t.string :position
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

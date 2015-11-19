class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :stage
      t.date :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

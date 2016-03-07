class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :problem
      t.integer :level
      t.integer :power
      t.integer :genre

      t.timestamps null: false
    end
  end
end

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :figure
      t.integer :communicate
      t.integer :coordination
      t.integer :control
      t.integer :decision
      t.integer :p_figure
      t.integer :p_communicate
      t.integer :p_coordination
      t.integer :p_control
      t.integer :p_decision
      t.integer :grade
      t.string :name
      t.integer :state
      t.datetime :deadline
      t.integer :range
      t.integer :coin
      t.text :describe
      t.text :goal
      t.text :extra
      t.string :place
      t.references :user, index: true, foreign_key: true
      t.references :task_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

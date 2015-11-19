class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
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
      t.integer :theoretical
      t.integer :practical
      t.integer :grade
      t.integer :title
      t.integer :qualification
      t.integer :identity
      t.datetime :deadline
      t.integer :put_time
      t.integer :get_time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

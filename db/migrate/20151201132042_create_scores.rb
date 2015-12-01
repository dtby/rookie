class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :surface,     default: 0
      t.integer :communicate, default: 0
      t.integer :decision,    default: 0
      t.integer :cooperate,   default: 0
      t.integer :control,     default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

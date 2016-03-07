class CreateGrowLogs < ActiveRecord::Migration
  def change
    create_table :grow_logs do |t|
      t.string :content
      t.integer :grow_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

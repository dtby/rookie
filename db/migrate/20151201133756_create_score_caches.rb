class CreateScoreCaches < ActiveRecord::Migration
  def change
    create_table :score_caches do |t|
      t.integer :power, default: 1
      t.integer :level, default: 1
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :a
      t.text :b
      t.text :c
      t.text :d
      t.text :e
      t.text :f
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

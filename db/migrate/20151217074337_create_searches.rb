class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :options
      t.string :other

      t.timestamps null: false
    end
  end
end

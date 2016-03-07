class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :number
      t.string :nickname
      t.string :name
      t.string :nation
      t.integer :gender
      t.string :phone
      t.string :native
      t.string :present

      t.timestamps null: false
    end
  end
end

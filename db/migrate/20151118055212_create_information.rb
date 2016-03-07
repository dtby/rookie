class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :birth_account
      t.string :qq
      t.string :email
      t.string :id_number
      t.integer :education
      t.string :graduate
      t.date :graduation_time
      t.integer :political
      t.string :hobbies
      t.string :specialty
      t.string :language
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

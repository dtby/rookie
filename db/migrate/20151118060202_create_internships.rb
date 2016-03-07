class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.string :company
      t.string :position
      t.string :performance
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

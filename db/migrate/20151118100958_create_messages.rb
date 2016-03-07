class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :mobile
      t.string :code

      t.timestamps null: false
    end
  end
end

class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :address
      t.string :task_type

      t.timestamps null: false
    end
  end
end

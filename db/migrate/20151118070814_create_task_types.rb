class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end

class AddTaskGradeToApply < ActiveRecord::Migration
  def change
    add_column :applies, :task_grade, :integer
  end
end

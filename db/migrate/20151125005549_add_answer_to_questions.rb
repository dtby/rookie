class AddAnswerToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer, :integer
  end
end

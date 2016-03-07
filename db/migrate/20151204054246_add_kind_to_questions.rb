class AddKindToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :kind, :integer
  end
end

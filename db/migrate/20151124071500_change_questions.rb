class ChangeQuestions < ActiveRecord::Migration
  def change
  	change_table :questions do |t|
  		t.index :level
  		t.index :power
  		t.index :genre
  	end
  end
end

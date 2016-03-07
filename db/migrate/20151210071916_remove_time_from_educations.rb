class RemoveTimeFromEducations < ActiveRecord::Migration
  def change
    remove_column :educations, :time, :datetime
  end
end

class AddTimeToEducations < ActiveRecord::Migration
  def change
    add_column :educations, :time, :string
    add_column :educations, :name, :string
  end
end

class FixOptions < ActiveRecord::Migration
  def change
  	add_column :options, :tab, :integer
  	add_column :options, :content, :string

  	remove_column :options, :a, :text
		remove_column :options, :b, :text
		remove_column :options, :c, :text
		remove_column :options, :d, :text
		remove_column :options, :e, :text
		remove_column :options, :f, :text
  end
end

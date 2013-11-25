class ChangeRatingToInteger < ActiveRecord::Migration
  def change
  	# change_column :props, :rating, :integer
  	remove_column :props, :rating

  	add_column :props, :rating, :integer, default: 0, null: false
  end
end

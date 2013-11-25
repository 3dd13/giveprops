class AddRatedByUserIdToProps < ActiveRecord::Migration
  def change
    add_column :props, :rated_by_user_id, :integer
    add_index :props, :rated_by_user_id
  end
end

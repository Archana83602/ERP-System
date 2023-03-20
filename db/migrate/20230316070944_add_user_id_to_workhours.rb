class AddUserIdToWorkhours < ActiveRecord::Migration[7.0]
  def change
    add_column :workhours, :user_id, :integer
    add_index :workhours, :user_id
  end
end

class AddColumnsAndIndexToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :user_id, :integer
    add_column :friendships, :friend_id, :integer
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end

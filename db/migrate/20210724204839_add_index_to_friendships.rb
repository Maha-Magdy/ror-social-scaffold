class AddIndexToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_index :friendships, [:user_id, :friend_id]
  end
end

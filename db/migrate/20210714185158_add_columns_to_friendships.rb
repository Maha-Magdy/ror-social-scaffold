class AddColumnsToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :sender_id, :integer
    add_column :friendships, :receiver_id, :integer
    add_column :friendships, :confirmed, :boolean
    add_index :friendships, :sender_id
    add_index :friendships, :receiver_id
  end
end

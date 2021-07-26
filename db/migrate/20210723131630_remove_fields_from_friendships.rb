class RemoveFieldsFromFriendships < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendships, :sender_id
    remove_column :friendships, :receiver_id
  end
end

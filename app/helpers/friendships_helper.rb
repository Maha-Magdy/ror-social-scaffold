module FriendshipsHelper
  def show_friendship(user)
    return if current_user[:id] == user[:id]

    send_friendship = current_user.pending_friends.find_by(id: user.id)
    pending_friendship = current_user.friend_requests.find_by(id: user.id)
    accepted_friendship = current_user.friends.find_by(id: user.id)

    if send_friendship
      friendship = Friendship.find_by(user_id: current_user[:id], friend_id: user[:id])
      link_to('Cancel Friendship Request', friendship_path(id: friendship[:id], user_id: current_user[:id], friend_id: user[:id]), method: :DELETE,
                                                                                                                                   class: 'btn-link')
    elsif pending_friendship
      friendship = Friendship.find_by(user_id: user[:id], friend_id: current_user[:id])
      link_to('Accept Friendship Request',
              friendship_path(id: friendship[:id]), method: :PUT, class: 'btn-link') +
        link_to('Remove Friendship Request',
                friendship_path(id: friendship[:id], user_id: user[:id], friend_id: current_user[:id]), method: :DELETE, class: 'btn-link')
    elsif accepted_friendship
      friendship = Friendship.find_by(user_id: current_user[:id], friend_id: user[:id])
      link_to('Remove Friendship', friendship_path(id: friendship[:id], user_id: current_user[:id], friend_id: user[:id]), method: :DELETE, class: 'btn-link')
    else
      link_to('Send Friend Request', friendships_path(friend_id: user[:id]), method: :post, class: 'btn-link')
    end
  end
end

module FriendshipsHelper
  def show_friendship(user)
    return if current_user[:id] == user[:id]

    send_friendship = Friendship.find_by(sender_id: current_user[:id], receiver_id: user[:id])
    pending_friendship = Friendship.find_by(sender_id: user[:id], receiver_id: current_user[:id], confirmed: false)
    accepted_friendship = Friendship.find_by(sender_id: user[:id], receiver_id: current_user[:id], confirmed: true)

    if send_friendship
      link_to('Cancel Friendship Request',  friendship_path(id: send_friendship[:id], sender_id: current_user[:id], receiver_id: user[:id]), method: :DELETE, class: 'btn-link')
    elsif pending_friendship
      link_to('Accept Friendship Request',  friendship_path(id: pending_friendship[:id], sender_id: user[:id], receiver_id: current_user[:id]), method: :PUT, class: 'btn-link') +
      link_to('Remove Friendship Request',  friendship_path(id: pending_friendship[:id], sender_id: user[:id], receiver_id: current_user[:id]), method: :DELETE, class: 'btn-link')
    elsif accepted_friendship
      link_to('Remove Friendship',  friendship_path(id: accepted_friendship[:id], sender_id: user[:id], receiver_id: current_user[:id]), method: :DELETE, class: 'btn-link')
    else
      link_to('Send Friend Request',  friendships_path(receiver_id: user[:id]), method: :post, class: 'btn-link')
    end
  end
end

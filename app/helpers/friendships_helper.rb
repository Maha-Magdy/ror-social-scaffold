module FriendshipsHelper
    def show_friendship(user)
        return if current_user[:id] == user[:id]
        link_to('Send Friend Request',  friendships_path(receiver_id: user[:id]), method: :post, class: 'profile-link')
    end
end

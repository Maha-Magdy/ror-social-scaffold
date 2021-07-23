class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(user_id: current_user[:id], friend_id: params[:friend_id], confirmed: false)

    if @friendship.save
      redirect_to users_path, notice: "Your friend request has been sent to #{@friendship.friend.name}."
    else 
      redirect_to users_path, alert: 'Your friend request cannot been sent.'
    end
  end

  def destroy
    friendship = Friendship.find_by(id: params[:id], user_id: params[:user_id],
                                    friend_id: params[:friend_id])

    inverted_friendship = Friendship.find_by(id: params[:id], user_id: params[:friend_id],
                                             friend_id: params[:user_id])
    if friendship
      friendship.destroy
      inverted_friendship.destroy if inverted_friendship
      redirect_to users_path, notice: 'Friendship request has been canceled.'
    else
      redirect_to users_path, alert: 'Friendship request cannot been canceled.'
    end
  end

  def update
    friendship = Friendship.find_by(id: params[:id], user_id: params[:user_id], friend_id: current_user)
    inverted_friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id], confirmed: true)
    friendship.confirmed = true
    if friendship.save && inverted_friendship.save
      redirect_to users_path, notice: "#{User.find_by(id: friendship.user_id).name} become your friend now"
    else
      redirect_to users_path, alert: 'Something went wrong, and you cannot accept the invitation now'
    end
  end
end

class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.new(sender_id: current_user[:id], receiver_id: params[:receiver_id], confirmed: false)

        if @friendship.save
            redirect_to users_path, notice: 'Your friend request has been sent.'
        elsif
            redirect_to users_path, alert: 'Your friend request cannot been sent.'
        end
    end

    def destroy
        friendship = Friendship.find_by(id: params[:id], sender_id:  params[:sender_id], receiver_id: params[:receiver_id])
        if friendship
            friendship.destroy
            redirect_to users_path, notice: 'Friendship request has been canceled.'
        else
            redirect_to users_path, alert: 'Friendship request cannot been canceled.'
        end
    end

    def update
        friendship = Friendship.find_by(id: params[:id], sender_id: params[:sender_id], receiver_id: current_user)
        friendship.confirmed = true
        if friendship.save
            redirect_to users_path, notice: "#{User.find_by(id: friendship.sender_id).name} become your friend now"
        else
            redirect_to users_path, alert: 'Something went wrong, and you cannot accept the invitation now'
        end
    end
end

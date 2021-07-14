class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.new(sender_id: current_user[:id], receiver_id: params[:receiver_id], confirmed: false)

        if @friendship.save
            redirect_to users_path, notice: 'Your friend request has been sent.'
        elsif
            redirect_to users_path, alert: 'Your friend request cannot been sent.'
        end
    end
end

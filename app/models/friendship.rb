class Friendship < ApplicationRecord
  validates :user, presence: true
  validates :friend, presence: true

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :confirmed_true, -> { where('confirmed=?', true) }

  def confirm_friend
    update(confirmed: true)
    Friendship.create!(friend_id: user_id, user_id: friend_id, confirmed: true)
  end
end

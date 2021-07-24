class Friendship < ApplicationRecord
  validates :user, presence: true
  validates :friend, presence: true

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :confirmed_true, -> { where('confirmed=?', true) }

  def confirm_friend
    self.update(confirmed: true)
    Friendship.create!(friend_id: self.user_id, user_id: self.friend_id, confirmed: true)
  end
end

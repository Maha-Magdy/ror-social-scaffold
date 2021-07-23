class Friendship < ApplicationRecord
  validates :user, presence: true, uniqueness: { scope: :friend_id }
  validates :friend, presence: true

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :confirmed_true, -> { where('confirmed=?', true) }
end

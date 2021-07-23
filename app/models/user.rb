class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :sended_friendships, class_name: :Friendship, dependent: :destroy, foreign_key: 'sender_id'
  # has_many :received_friendships, class_name: :Friendship, dependent: :destroy, foreign_key: 'receiver_id'
  has_many :friendships, class_name: :Friendship, dependent: :destroy, foreign_key: 'user_id'
  has_many :inverted_friendships, class_name: :Friendship, dependent: :destroy, foreign_key: 'friend_id'
end

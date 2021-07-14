class Friendship < ApplicationRecord
    validates :sender, presence: true, uniqueness: { scope: :receiver_id }
    validates :receiver, presence: true

    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
end

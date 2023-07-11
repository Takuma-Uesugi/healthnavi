class ChatRoom < ApplicationRecord
  validates :user_id, uniqueness: { scope: :adviser_id }
  
  belongs_to :user
  belongs_to :adviser
  has_many :messages
end

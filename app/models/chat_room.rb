class ChatRoom < ApplicationRecord
  belongs_to :user
  belongs_to :adviser
  has_many :messages
  
  validates :user_id, uniqueness: { scope: :adviser_id }
end

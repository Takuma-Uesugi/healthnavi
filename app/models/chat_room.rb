class ChatRoom < ApplicationRecord
  belongs_to :user
  belongs_to :adviser
  
  validates :user_id, uniqueness: { scope: :adviser_id }
end

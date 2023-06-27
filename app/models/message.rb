class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :adviser, optional: true
  belongs_to :chat_room
  
  validates :body, presence: true
end

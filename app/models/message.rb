class Message < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :user, optional: true
  belongs_to :adviser, optional: true
  belongs_to :chat_room
end

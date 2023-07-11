class AdviserUser < ApplicationRecord
  validates :user_id, uniqueness: { scope: :adviser_id }
  
  belongs_to :user
  belongs_to :adviser
end

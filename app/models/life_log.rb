class LifeLog < ApplicationRecord
  validates :sleepiness, inclusion: { in: 1..3 }
  validates :feeling, inclusion: { in: 1..5 }
  validates :feces, inclusion: { in: 1..8 }
  
  belongs_to :user
end

class Content < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true
  validates :image, presence: true
  validates :first_paragraph, presence: true
  validates :first_content, presence: true
  
  belongs_to :adviser, optional: true
  has_many :content_categories
  has_many :categories, through: :content_categories
end

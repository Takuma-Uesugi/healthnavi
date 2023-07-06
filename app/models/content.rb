class Content < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true
  validates :image, presence: true
  validates :first_paragraph, presence: true
  validates :first_content, presence: true
  
  belongs_to :adviser, optional: true
  has_many :content_categories
  has_many :categories, through: :content_categories
  
  def save_with_categories(category_ids)
    ActiveRecord::Base.transaction do
      save!
      category_ids.each do |category_id|
        content_categories.create!(category_id: category_id)
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
end

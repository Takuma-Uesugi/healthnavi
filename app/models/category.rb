class Category < ApplicationRecord
  validates :en_name, uniqueness: { scope: :ja_name }
  
  has_many :content_categories
  has_many :contents, through: :content_categories
end

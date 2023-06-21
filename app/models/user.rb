class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :age, presence: true
  validates :goal, presence: true
  
  has_many :adviser_users
  has_many :connect_advisers, through: :adviser_users, source: :adviser
  has_many :chat_rooms
  has_many :chat_to_advisers, through: :chat_rooms, source: :adviser
  has_many :messages
  
  def update_with_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update(params, *options)

    clean_up_passwords
    result
  end
end

class Adviser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :certification, presence: true
  validates :career, presence: true
  validates :message, presence: true
  
  has_many :adviser_users
  has_many :partners, through: :adviser_users, source: :user
  has_many :chat_rooms
  has_many :chat_to_users, through: :chat_rooms, source: :user
  has_many :messages
  has_many :contents
  
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

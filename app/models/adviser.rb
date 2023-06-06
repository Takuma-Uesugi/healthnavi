class Adviser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :image, presence: true
  validates :certification, presence: true
  validates :career, presence: true
  validates :message, presence: true
  
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

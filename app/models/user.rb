class User < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :pictures
  has_many :restaurants
  has_many :hashtags

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  :registerable,
  :recoverable,
  :rememberable,
  :trackable,
  :validatable
end

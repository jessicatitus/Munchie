class Restaurant < ApplicationRecord
  mount_uploader :img_url, ImageUploader
  has_many :pictures
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :img_url, presence: true

  def self.search(search)
  where("name ILIKE ? OR city ILIKE ?", "%#{search}%", "%#{search}%")
  end
end

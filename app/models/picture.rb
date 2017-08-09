class Picture < ApplicationRecord
  mount_uploader :img_url, ImageUploader
  belongs_to :restaurant

  validates :img_url, presence: true

end

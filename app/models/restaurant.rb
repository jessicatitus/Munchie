class Restaurant < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :img_url, presence: true


end

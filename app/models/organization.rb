class Organization < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :tech_stacks, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :technologies, through: :tech_stacks
  has_many :announcements, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  geocoded_by :address
  after_validation :geocode

end

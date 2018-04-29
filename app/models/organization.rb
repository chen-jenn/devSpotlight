class Organization < ApplicationRecord
  has_many :users
  has_many :tech_stacks
  has_many :events
  has_many :technologies, through: :tech_stacks

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

end

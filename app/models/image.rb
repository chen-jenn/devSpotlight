class Image < ApplicationRecord
  belongs_to :organization, dependent: :destroy

  mount_uploader :image, ImageUploader
end

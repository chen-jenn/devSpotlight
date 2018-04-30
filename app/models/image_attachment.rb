class ImageAttachment < ApplicationRecord
  belongs_to :image
  mount_uploader :image, ImageUploader
end

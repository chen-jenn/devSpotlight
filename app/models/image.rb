class Image < ApplicationRecord
  belongs_to :organization, dependent: :destroy
  
  has_many :image_attachments
  accepts_nested_attributes_for :image_attachments

  mount_uploader :image, ImageUploader
end

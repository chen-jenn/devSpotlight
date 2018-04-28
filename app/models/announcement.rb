class Announcement < ApplicationRecord
  belongs_to :organization

  validates :article_name, presence: true
end

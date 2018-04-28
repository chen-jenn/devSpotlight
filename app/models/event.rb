class Event < ApplicationRecord
  belongs_to :organization

  validates :event_name, presence: true
end

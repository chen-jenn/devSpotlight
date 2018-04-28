class Technology < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :tech_stacks
  has_many :organizations, through: :tech_stacks

end

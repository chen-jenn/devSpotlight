class User < ApplicationRecord
  belongs_to :organization
  has_secure_password
  after_initialize :default_organization  

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email,
    presence: true,
    uniqueness: true,
    format: VALID_EMAIL_REGEX

  enum permission_type: { team_member: 1, manager: 2, admin: 3 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def default_organization
    self.organization_id = 1
  end
end

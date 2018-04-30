class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include PgSearch
  pg_search_scope :search_by_name, :against => :name
end

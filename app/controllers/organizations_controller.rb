class OrganizationsController < ApplicationController

  def index
  end
  
  
  
  def to_param
    "#{id}-#{title}".parameterize
  end

end

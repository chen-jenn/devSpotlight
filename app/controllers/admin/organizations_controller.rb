class Admin::OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index #probably dont need this action either, unless to display more detailed information 
    @organizations = Organization.order(name: :asc)
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def authorize_admin!
    unless current_user.permission_type == 3
      flash[:alert] = "Access Denied"
      redirect_to home_path
    end
  end


<<<<<<< HEAD
=======
  def organization_params
    params.require(:organization).permit(:name, :description, :employee_count, :tech_team_size, :image, :address, :website_url, :twitter, { technology_ids: [] }), :published
  end

>>>>>>> d685936c8ba02bb92e9471c5e54c4d81049621d2
end

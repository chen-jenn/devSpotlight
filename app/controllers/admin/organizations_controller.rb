class Admin::OrganizationsController < ApplicationController
  before_action :authenticate_user! #is logged in
  before_action :authorize_admin! # and is also admin

  def index
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

  # def show
  #   # might not need
  # end

  private
  def authorize_admin!
    unless current_user.permission_type == 3
      flas[:alert] = "Access Denied"
      redirect_to home_path
    end
  end

  def organization_params
    params.require(:organization).permit(:name, :description, :employee_count, :tech_team_size, :image, :address, :website_url, :twitter, { technology_ids: [] }), :published
  end
end

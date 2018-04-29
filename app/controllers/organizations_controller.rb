class OrganizationsController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @organizations = Organization.order(created_at: :desc)
  end

  def create
    @organization = Organization.new organization_params
    @user = User.find params[:id]
    if @user.permission_type != 1
      if @organization.save
        redirect_to organization_path
      else
        render :new
      end
    else
      flash[:notice] = "You do not have manager or admin permission!"
      redirect_to home_path
    end
  end

  def update
    @organization = Organization.find params[:id]
    @user = User.find params[:id]
    if @organization.update organization_params
      redirect_to organization_path(@organization)
    else
      render :edit
    end
  end

  def destroy
    @organization = Organization.find params[:id]
    @organization.destroy
    redirect_to organizations_path
  end

  def to_param
    "#{id}-#{title}".parameterize
  end

  private

  def organization_params
    params.require(:organization).permit(
      :name,
      :description,
      :employee_count,
      :tech_team_size,
      :address,
      :website_url,
      :twitter,
      :image,
      {technology_ids: [] },
      :published
    )
  end

  def authorize_admin!
    unless current_user.permission_type == 3
      flash[:alert] = "Access Denied"
      redirect_to home_path
    end
  end

end



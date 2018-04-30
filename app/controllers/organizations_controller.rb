class OrganizationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin!, except: [:index, :new, :create, :show]
  before_action :find_org, only: [:show, :update, :destroy, :edit]

  def index
    word = params[:search]
    @organizations = Organization.order(created_at: :desc)
    @search = Organization.where("name ILIKE ?","%#{word}%")
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new organization_params
    @user = current_user

    if user_signed_in?
      if @organization.save
        @user.update is_creator: true
        flash[:notice] = "Successfully created!"
        redirect_to organizations_path
      else
        render :new
      end
    else
      flash[:notice] = "The organization could not be created!"
      redirect_to home_path
    end
  end

  def edit
  end

  def update
    @user = current_user
    if @organization.update organization_params
      flash[:notice] = "Successfully updated!"
      redirect_to organization_path(@organization)
    else
      flash[:notice] = "Couldn't be updated!"
      render :edit
    end
  end

  def destroy
    @organization.destroy
    if current_user.permission_type == 'admin'
      flash[:notice] = "Successfully destroyed!"
      redirect_to admin_organizations_path
    else
      flash[:notice] = "You do not have manager or admin permission!"
      redirect_to organizations_path
    end
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
    unless current_user.permission_type == "admin"
      flash[:alert] = "Access Denied"
      redirect_to home_path
    end
  end

  def find_org
    @organization = Organization.find params[:id]
  end

end

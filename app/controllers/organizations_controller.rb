class OrganizationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin!, except: [:index, :new, :create, :show]

  def index
    word = params[:search]
    @organizations = Organization.order(created_at: :desc)
    @search = Organization.where("name ILIKE ?","%#{word}%")

  end

  def show
    @organization = Organization.find params[:id]
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
        redirect_to organizations_path
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

    if current_user.permission_type == 'admin'
      redirect_to admin_organizations_path
    else
      redirect_to organizations_path
    end
  end

  def to_param
    "#{id}-#{title}".parameterize
  end

  def claim_request
    # user = current_user
    render plain: 'organizations#claim_request'
    # claim request will patch the employee user's approved column to "true"
    # user.approved = true
    # user.save
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

end

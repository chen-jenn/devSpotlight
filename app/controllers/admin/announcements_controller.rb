class Admin::AnnouncementsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @announcements = Announcement.order(created_at: :desc)
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new announcement_params
    if @announcement.save
      redirect_to announcement_path
    else
      render :new
    end
  end

  def edit
    @announcement = Announcement.find params[:id]
  end

  def update
    if @announcement.update announcement_params
      redirect_to announcement_path(@announcement)
    else
      render :edit
    end
  end

  def destroy
    @announcement = Announcement.find params[:id]
    @announcement.destroy
    redirect_to announcements_path
  end

  # def show
    # might not need
  # end

  private

  def authorize_admin!
    unless current_user.permission_type == 3
      flas[:alert] = "Access Denied"
      redirect_to home_path
    end
  end

  def announcement_params
    params.require(:announcement).permit(
      :article_url,
      :article_name
    )
  end

end

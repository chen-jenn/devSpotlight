class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.order(created_at: :asc)
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
  end


  private
  def authorize_admin!
    unless current_user.permission_type == 3
      flas[:alert] = "Access Denied"
      redirect_to home_path
    end
  end
end

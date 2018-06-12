class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.order(created_at: :asc)
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    pa = user_params

    if user_params[:permission_type] == '1'
      pa[:permission_type] = 'team_member'
    elsif user_params[:permission_type] == '2'
      pa[:permission_type] = 'manager'
    elsif user_params[:permission_type] == '3'
      pa[:permission_type] = 'admin'
    end

    if @user.update pa
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to admin_users_path
  end


  private
  def authorize_admin!
    unless current_user.permission_type == "admin"
      flash[:alert] = "Access Denied"
      redirect_to home_path
    end
  end

  def user_params
    # admin shouldnt be able to change email or names
    params.require(:user).permit(:approved, :permission_type, :organization_id)
  end
end

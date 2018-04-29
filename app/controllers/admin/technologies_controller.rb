class Admin::TechnologiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @technologies = Technology.order(name: :asc)
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
      flas[:alert] = "Access Denied"
      redirect_to home_path
    end
  end
end

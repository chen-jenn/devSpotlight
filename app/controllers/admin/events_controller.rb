class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:edit, :update, :destroy]
  before_action :authorize_admin!

  def index
    @events = Event.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @event.update event_params
      redirect_to admin_event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
  end

  private
  def authorize_admin!
    unless current_user.permission_type == 3
      flas[:alert] = "Access Denied"
      redirect_to home_path
    end
  end

  def find_event
    @event = Event.find params[:id]
  end

  def event_params
    params.require(:event).permit(:event_url, :event_date)
  end

end

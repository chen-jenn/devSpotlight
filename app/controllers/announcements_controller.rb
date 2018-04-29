class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.order(created: :desc)
  end

end

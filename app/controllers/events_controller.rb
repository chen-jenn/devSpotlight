class EventsController < ApplicationController

  def index
    params = { category: '8',
        city: 'Vancouver',
        country: 'canada',
        status: 'upcoming',
        format: 'json',
        page: '100',
        time: '0m,2m'
        }
      meetup_api = MeetupApi.new
      @events = meetup_api.open_events(params)
  end

end

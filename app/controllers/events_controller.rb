class EventsController < ApplicationController

  def index
    params = { category: '3',
        city: 'Vancouver',
        country: 'canada',
        status: 'upcoming',
        format: 'json',
        page: '20',
        time: '0m,2m'
        }
      meetup_api = MeetupApi.new
      @events = meetup_api.open_events(params)
  end

end

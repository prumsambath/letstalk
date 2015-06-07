class EventsController < ApplicationController
  def index
    @events = Event.all_active
  end

end

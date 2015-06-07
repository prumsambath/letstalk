class EventsController < ApplicationController
  def index
    @events = Event.all_active.order('due_at DESC').page(params[:page]).per(15)
  end
end

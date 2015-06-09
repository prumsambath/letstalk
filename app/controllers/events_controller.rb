class EventsController < ApplicationController
  def index
    @events = Event.all_active.order('due_at DESC').page(params[:page]).per(15)
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: "The event was successfully saved."
    else
      flash[:error] = "Error creating an event. Please try again."
      render :new
    end
  end

  def new
    @event = Event.new
  end

  private

  def event_params
    params.require(:event).permit(:topic, :agenda, :due_at, :seat)
  end
end

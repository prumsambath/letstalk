class EventsController < ApplicationController
  def index
    if params[:user_id]
      @events = current_user.owned_events.order('due_at DESC').page(params[:page]).per(15)
    else
      @events = Event.all_active.order('due_at DESC').page(params[:page]).per(15)
    end
  end

  def create
    @event = current_user.owned_events.build(event_params)
    # TODO: fix saving due_at field
    @event.due_at = DateTime.strptime(event_params[:due_at], "%m/%d/%Y %I:%M %p")

    if @event.save
      redirect_to [current_user, @event], notice: "The event was successfully saved."
    else
      flash[:error] = "Error creating an event. Please try again."
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:topic, :agenda, :due_at, :seat, :user_id)
  end
end

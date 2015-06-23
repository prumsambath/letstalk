class EventsController < ApplicationController
  before_action :owner, except: [:index]

  def index
    @events = Event.all_active.order('due_at DESC').page(params[:page]).per(15)
  end

  def create
    @event = Event.new(event_params)
    # TODO: fix saving due_at field
    @event.due_at = DateTime.strptime(event_params[:due_at], "%m/%d/%Y %I:%M %p")
    @event.owner = @owner

    if @event.save
      redirect_to [@owner, @event], notice: "The event was successfully saved."
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

  def owner
    @owner = User.find(params[:user_id])
  end
end

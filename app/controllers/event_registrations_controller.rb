class EventRegistrationsController < ApplicationController
  def new
    @event = Event.find(params[:id])
  end

  def create
    user = User.find_by(email: params[:email])
  end
end

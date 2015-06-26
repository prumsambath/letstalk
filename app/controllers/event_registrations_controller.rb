class EventRegistrationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    participant = User.find_by(email: params[:email])

    if event.participants.include?(participant)
      redirect_to [current_user, event], alert: "#{participant.full_name} was already invited."
    else
      event.participants << participant
      event.save
      redirect_to [current_user, event], notice: "#{participant.full_name} is successfully invited."
    end
  end

  def destroy
    event_registration = EventRegistration.find(params[:id])
    if event_registration.destroy
      redirect_to [current_user, event_registration.event], notice: "#{event_registration.participant.full_name} is successfully removed."
    end
  end
end

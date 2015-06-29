class EventRegistrationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    participant = User.find_by(email: params[:email])

    if event.participants.include?(participant)
      redirect_to [current_user, event], alert: "#{participant.full_name} was already invited."
      return
    end

    if event.room_full?
      redirect_to [current_user, event], alert: "The room is full. You cannot invite more."
      return
    end

    event.participants << participant
    event.save

    EventRegistrationMailer.confirmation(event, participant).deliver_now

    redirect_to [current_user, event], notice: "#{participant.full_name} is successfully invited."
  end

  def destroy
    event_registration = EventRegistration.find(params[:id])
    if event_registration.destroy
      redirect_to [current_user, event_registration.event], notice: "#{event_registration.participant.full_name} is successfully removed."
    end
  end
end

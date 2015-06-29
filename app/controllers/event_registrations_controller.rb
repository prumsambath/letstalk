class EventRegistrationsController < ApplicationController
  before_action :owned_event

  def create
    participant = User.find_by(email: params[:email])

    if @event.participants.include?(participant)
      redirect_to [current_user, @event], alert: "#{participant.full_name} was already invited."
      return
    end

    if @event.room_full?
      redirect_to [current_user, @event], alert: "The room is full. You cannot invite more."
      return
    end

    @event.participants << participant
    @event.save

    EventRegistrationMailer.confirmation(@event, participant).deliver_now

    redirect_to [current_user, @event], notice: "#{participant.full_name} is successfully invited."
  end

  def destroy
    event_registration  = @event.event_registrations.find(params[:id])
    if event_registration.destroy
      redirect_to [current_user, @event], notice: "#{event_registration.participant.full_name} is successfully removed."
    end
  end

  private

  def owned_event
    @event = current_user.owned_events.find(params[:event_id])
  end
end

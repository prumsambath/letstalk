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

    if @event.owner == current_user
      EventRegistrationMailer.invite_confirmation(@event, participant).deliver_now
    else
      EventRegistrationMailer.request_confirmation(@event, @event.owner).deliver_now
    end

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
    @event = Event.find(params[:event_id])
  end
end

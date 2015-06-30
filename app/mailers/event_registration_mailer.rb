class EventRegistrationMailer < ActionMailer::Base
  default from: ENV['mailer_sender']

  def invite_confirmation(event, participant)
    @event, @participant = event, participant

    mail to: participant.email,
         subject: "Event Participation Request"
  end

  def request_confirmation(event, owner)
    @event, @owner = event, owner

    mail to: owner.email,
         subject: "Event Participation Request"
  end

end

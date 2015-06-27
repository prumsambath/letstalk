class EventRegistrationMailer < ActionMailer::Base
  default from: ENV['mailer_sender']

  def confirmation(event, participant)
    @event, @participant = event, participant

    mail to: participant.email,
         subject: "Event Participation Request"
  end
end

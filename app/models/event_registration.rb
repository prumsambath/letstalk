class EventRegistration < ActiveRecord::Base
  belongs_to :participant, class_name: User, foreign_key: :user_id
  belongs_to :event

  def self.get_id(event, participant)
    where("event_id = ? and user_id = ?", event.id, participant.id).first.id
  end
end

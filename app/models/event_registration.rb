class EventRegistration < ActiveRecord::Base
  belongs_to :participant, class_name: User, foreign_key: :user_id
  belongs_to :event
end

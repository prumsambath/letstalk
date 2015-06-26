class Event < ActiveRecord::Base
  belongs_to :owner, class_name: User, foreign_key: :user_id

  has_many :event_registrations
  has_many :participants, through: :event_registrations

  scope :all_active, -> { where("due_at > ?", Time.now) }
end

class Event < ActiveRecord::Base
  belongs_to :user

  scope :all_active, -> { where("due_at > ?", Time.now) }
end

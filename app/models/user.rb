class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :owned_events, class_name: Event, foreign_key: :user_id
  has_many :event_registrations
  has_many :events, through: :event_registrations

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end

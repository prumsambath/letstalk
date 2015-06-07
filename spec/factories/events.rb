require 'faker'

FactoryGirl.define do
  factory :event do
    topic Faker::Lorem.sentence
    agenda Faker::Lorem.sentence
    due_at Faker::Time.forward(30)
    seat { rand(1..5) }
    user
  end
end

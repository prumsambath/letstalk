require 'faker'

# seed users
5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email:      Faker::Internet.email,
    password:   'helloworld'
  )
  user.confirm
  user.save
end
users = User.all

# seed events
100.times do
  Event.create!(
    user:   users.sample,
    topic:  Faker::Lorem.sentence,
    agenda: Faker::Lorem.sentence,
    due_at: Faker::Time.forward(30),
    seat:   rand(1..5)
  )
end

puts "Seed finished."
puts "#{User.count} users created."
puts "#{Event.count} events creatd."

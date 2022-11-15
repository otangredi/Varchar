require 'faker'

User.create!(email: "a@a.a", password: "aaaaaaaa")

20.times do
  Character.create!(
    name: Faker::Superhero.name,
    price: rand(20..50),
    description: Faker::Movie.quote,
    category: Faker::Superhero.prefix,
    user_id: 1
  )
end

5.times do
  booking = Booking.create!(
    start_date: Faker::Date.forward(days: 23),
    end_date: Faker::Date.backward(days: 14),
    status: ["Pending", "Completed", "Denied"].sample,
    user_id: 1,
    character_id: rand(1..20)
  )
end

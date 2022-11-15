require 'faker'

5.times do
  booking = Booking.create!(
    start_date: Faker::Date.forward(days: 23),
    end_date: Faker::Date.backward(days: 14),
    status: ["Pending", "Completed", "Denied"].sample,
    user_id: 1,
    character_id: rand(1..20)
  )
end

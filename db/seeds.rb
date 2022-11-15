require 'faker'

20.times do
  Character.create!(
    name: Faker::Superhero.name,
    price: rand(20..50),
    description: Faker::Movie.quote,
    category: Faker::Superhero.prefix,
    user_id: 1
  )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5 USER
# 5.times do
#   User.create(email: Faker::Internet.email, name: Faker::Name.name, location: Faker::Address.city, password: Faker::Alphanumeric.alpha(number: 10))
# end

# 20 Pets
20.times do 
  hash = {
    name: Faker::Creature::Dog.name, 
    pet_type: ["Dog", "Cat"].sample, 
    description: Faker::Quotes::Rajnikanth.joke, 
    price: rand(25..100),
    user_id: rand(1..3)
  }
  Pet.create(hash)
end
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
    name: Faker::Name.name, 
    pet_type: ["Dog", "Cat"].sample, 
    description: Faker::Alphanumeric.alpha(number: 50), 
    image_url: Faker::Alphanumeric.alpha(number: 10), 
    price: rand(6..100),
    user_id: rand(1..User.count)
  }
  Pet.create(hash)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Cleaning up database...'
User.destroy_all
Listing.destroy_all

puts 'Database cleaned!'
puts 'Creating data...'

User.create!(
  first_name: 'Kevin',
  last_name: 'Collier',
  email: 'kevin@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: true,
  address: Faker::Address.city,
  password: 'secret123'
)

User.create!(
  first_name: 'Curtis',
  last_name: 'Lu',
  email: 'curtis@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: true,
  address: Faker::Address.unique.city,
  password: 'secret123'
)

User.create!(
  first_name: 'Juri',
  last_name: 'Kato',
  email: 'juri@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: false,
  address: Faker::Address.unique.city,
  password: 'secret123'
)

User.create!(
  first_name: 'Favi',
  last_name: 'Fernandez',
  email: 'favi@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: false,
  address: Faker::Address.unique.city,
  password: 'secret123'
)

8.times do
  Listing.create!(
    name: Faker::Food.dish,
    category: Faker::Food.ethnic_category,
    price: Faker::Commerce.price
  )
end

puts 'Database seeded!'

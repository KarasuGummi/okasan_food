# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts 'Cleaning up database...'
Booking.destroy_all
Listing.destroy_all
User.destroy_all

puts 'Database cleaned!'

puts 'Creating users...'

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

puts 'Creating listings...'

listing1 = Listing.create!(
  name: 'Omurice',
  category: 'Japanese',
  description: 'Fried rice flavored with tangy ketchup with a fluffy egg omlette on top.',
  price: '1000',
  user: User.first
)
file = URI.open('https://www.honestfoodtalks.com/wp-content/uploads/2023/03/Omurice-zigzag-red-sauce-on-top.jpg')
listing1.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing2 = Listing.create!(
  name: 'Macaroni and Cheese',
  category: 'American',
  description: 'Macaroni pasta smothered in a rich, creamy cheese sauce and baked to create a crispy crust.',
  price: '1500',
  user: User.first
)
file = URI.open('https://www.washingtonpost.com/resizer/kvKDeOnyO3uTdozUijZtRg_AYyE=/arc-anglerfish-washpost-prod-washpost/public/JLFY2YFBR24TY4ZDEJRM4FMKDI.jpg')
listing2.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing3 = Listing.create!(
  name: 'Mapo Tofu',
  category: 'Chinese',
  description: 'Soft tofu cubes in a rich, numbing sauce made with chili bean paste, ground pork, and Sichuan peppercorns.',
  price: '2000',
  user: User.first
)
file = URI.open('https://omnivorescookbook.com/wp-content/uploads/2022/05/220510_Mapo-Tofu_550.jpg')
listing3.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing4 = Listing.create!(
  name: 'Nasi Lemak',
  category: 'Malaysian',
  description: 'Coconut rice served with various accompaniments such as crispy anchovies, roasted peanuts, cucumber slices, boiled eggs, and spicy sambal sauce.',
  price: '1800',
  user: User.first
)
file = URI.open('https://www.angsarap.net/wp-content/uploads/2014/11/Nasi-Lemak-Wide.jpg')
listing4.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing5 = Listing.create!(
  name: 'PB&J',
  category: 'American',
  description: 'Peanut butter and jelly sandwiched between two slices of bread.',
  price: '600',
  user: User.first
)
file = URI.open('https://potatorolls.com/wp-content/uploads/2020/10/Grilled-PB-and-J2.jpg')
listing5.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing6 = Listing.create!(
  name: 'Tiramisu',
  category: 'Italian',
  description: 'Layers of coffee-soaked ladyfingers and a rich, creamy mixture of mascarpone cheese, eggs, and sugar all dusted with cocoa powder.',
  price: '3000',
  user: User.first
)
file = URI.open('https://www.livewellbakeoften.com/wp-content/uploads/2021/01/Tiramisu-8s.jpg')
listing6.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

# 9.times do
#   food = Listing.create!(
#     name: Faker::Food.dish,
#     category: Faker::Food.ethnic_category,
#     price: Faker::Commerce.price(range: 1000..20_000),
#     description: Faker::Food.description,
#     user: User.first
#   )
#   file = URI.open(Faker::LoremFlickr.image(size: '300x300', search_terms: ['food']))
#   food.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')
# end

puts 'Database seeded!'

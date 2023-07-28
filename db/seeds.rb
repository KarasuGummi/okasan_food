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

user1 = User.create!(
  first_name: 'Aya',
  last_name: 'Tanaka',
  email: 'aya@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: true,
  address: Faker::Address.city,
  password: 'secret123'
)
file = URI.open('https://res.cloudinary.com/du53mgiot/image/upload/v1690418678/development/3oepwtaltqbpfxmqts4icuqz257m.jpg')
user1.photo.attach(io: file, filename: 'profile1.jpg', content_type: 'image/png')

user2 = User.create!(
  first_name: 'Yuki',
  last_name: 'Nakamura',
  email: 'yuki@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: true,
  address: Faker::Address.unique.city,
  password: 'secret123'
)
file = URI.open('https://res.cloudinary.com/du53mgiot/image/upload/v1690418683/development/b5sn6k1g5az9ye8nitvfr3dsigrb.jpg')
user2.photo.attach(io: file, filename: 'profile1.jpg', content_type: 'image/png')

user3 = User.create!(
  first_name: 'polly',
  last_name: 'wigglesworth',
  email: 'polly@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: false,
  address: Faker::Address.unique.city,
  password: 'secret123'
)
file = URI.open('https://res.cloudinary.com/du53mgiot/image/upload/v1690418673/development/gq7d3la5mukemfggvmtx1nexustk.jpg')
user3.photo.attach(io: file, filename: 'profile1.jpg', content_type: 'image/png')

user4 = User.create!(
  first_name: 'emily',
  last_name: 'johnson',
  email: 'emily@app.com',
  phone: Faker::PhoneNumber.cell_phone_in_e164,
  momma: false,
  address: Faker::Address.unique.city,
  password: 'secret123'
)
file = URI.open('https://res.cloudinary.com/du53mgiot/image/upload/v1690418669/development/uvxwdkmayuov95fojamxxkcjhqxh.jpg')
user4.photo.attach(io: file, filename: 'profile1.jpg', content_type: 'image/png')

puts 'Creating listings...'

listing1 = Listing.create!(
  name: 'Omurice',
  category: 'Japanese',
  description: 'Fried rice flavored with tangy ketchup with a fluffy egg omlette on top.',
  price: '1000',
  user: user1
)
file = URI.open('https://www.honestfoodtalks.com/wp-content/uploads/2023/03/Omurice-zigzag-red-sauce-on-top.jpg')
listing1.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing2 = Listing.create!(
  name: 'Macaroni and Cheese',
  category: 'American',
  description: 'Macaroni pasta smothered in a rich, creamy cheese sauce and baked to create a crispy crust.',
  price: '1500',
  user: user2
)
file = URI.open('https://www.washingtonpost.com/resizer/kvKDeOnyO3uTdozUijZtRg_AYyE=/arc-anglerfish-washpost-prod-washpost/public/JLFY2YFBR24TY4ZDEJRM4FMKDI.jpg')
listing2.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing3 = Listing.create!(
  name: 'Mapo Tofu',
  category: 'Chinese',
  description: 'Soft tofu cubes in a rich, numbing sauce made with chili bean paste, ground pork, and Sichuan peppercorns.',
  price: '2000',
  user: user3
)
file = URI.open('https://omnivorescookbook.com/wp-content/uploads/2022/05/220510_Mapo-Tofu_550.jpg')
listing3.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing4 = Listing.create!(
  name: 'Nasi Lemak',
  category: 'Malaysian',
  description: 'Coconut rice served with various accompaniments such as crispy anchovies, roasted peanuts, cucumber slices, boiled eggs, and spicy sambal sauce.',
  price: '1800',
  user: user1
)
file = URI.open('https://www.angsarap.net/wp-content/uploads/2014/11/Nasi-Lemak-Wide.jpg')
listing4.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing5 = Listing.create!(
  name: 'PB&J',
  category: 'American',
  description: 'Peanut butter and jelly sandwiched between two slices of bread.',
  price: '600',
  user: user2
)
file = URI.open('https://potatorolls.com/wp-content/uploads/2020/10/Grilled-PB-and-J2.jpg')
listing5.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing6 = Listing.create!(
  name: 'Tiramisu',
  category: 'Italian',
  description: 'Layers of coffee-soaked ladyfingers and a rich, creamy mixture of mascarpone cheese, eggs, and sugar all dusted with cocoa powder.',
  price: '3000',
  user: user3
)
file = URI.open('https://www.livewellbakeoften.com/wp-content/uploads/2021/01/Tiramisu-8s.jpg')
listing6.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing7 = Listing.create!(
  name: 'Paella',
  category: 'Spanish',
  description: 'Rice flavoured with saffron-infused broth and topped with various ingredients.',
  price: '10000',
  user: user1
)
file = URI.open('https://spanishsabores.com/wp-content/uploads/2020/05/Seafood-Paella-1837-Blog.jpg')
listing7.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

listing8 = Listing.create!(
  name: 'Chocolate Chip Cookies',
  category: 'American',
  description: 'Soft and chewy treats filled with rich and sweet chocolate chips.',
  price: '500',
  user: user2
)
file = URI.open('https://handletheheat.com/wp-content/uploads/2020/10/BAKERY-STYLE-CHOCOLATE-CHIP-COOKIES-9-637x637-1.jpg')
listing8.photo.attach(io: file, filename: 'food.png', content_type: 'image/png')

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

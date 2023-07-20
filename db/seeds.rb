# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning up database..."
User.destroy_all
puts "Database cleaned"
puts "Start creating users....."
kevin = User.create!(first_name: "kevin", last_name: "kevin", email: "kevin@app.com", phone: "08034556778", momma: true, address: "Oita", password: "secret123")
User.create!(first_name: "curtis", last_name: "curtis", email: "curtis@app.com", phone: "08034556778", momma: true, address: "Saga", password: "secret123")
User.create!(first_name: "favi", last_name: "juri", email: "juri@app.com", phone: "08034556778", momma: false, address: "Kiba", password: "secret123")
User.create!(first_name: "favi", last_name: "favi", email: "favi@app.com", phone: "08034556778", momma: false, address: "Sanda", password: "secret123")
puts "Users created"

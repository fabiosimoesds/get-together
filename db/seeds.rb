# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_name = ['Jose', 'Mark', 'Belinda', 'Antonio', 'Ricky']
last_name = ['Smith', 'Silva', 'Dornelles', 'Marino', 'Jackson', 'Blunt', 'Griffiths']
address = ['Rio de Janeiro', 'San Diego']
sport = ["Surfing", "Skateboarding", "Skiing/Snowboarding", "Mountain Bike", "Hiking", "Paragliding"]
dob = [Date.today - 7200, Date.today - 5568, Date.today - 9510]
start_date = [Date.today + 4, Date.today + 8, Date.today + 5]
end_date = [Date.today + 9, Date.today + 20, Date.today + 15]
password = '123456'

puts "Destroying all Data"
Album.destroy_all
Trip.destroy_all
User.destroy_all
number = 0
puts "Creating 5 user with 10 trips each"
5.times do
  name = first_name.sample
  last = last_name.sample
  number += 1
  email = "#{name}.#{last}#{number}@gmail.com"
  bio = 'Always the same, I love all the sports check out my profile and come and lets enjoy outside'
  user = User.create!(
                first_name: name,
                last_name: last,
                dob: dob.sample,
                password: password,
                email: email,
                address: address.sample,
                bio: bio,
                sport_one: sport.sample,
                sport_two: sport.sample,
                sport_three: sport.sample
                )
  10.times do
    trip = Trip.new(address: address.sample, sport: sport.sample, start_date: start_date.sample, end_date: end_date.sample)
    trip.user = user
    trip.save
    Album.create!(name: "#{trip.sport} in #{trip.address}", trip: trip)
  end
end

puts "Seeding done!"

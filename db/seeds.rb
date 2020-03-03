# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)






require 'faker'

# Create a default development user for everyone to use
User.create(email: "dev@email.com", password: "password")

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: "password"
  )
  user.save!
end
puts 'Finished!'



puts 'Creating 10 fake collections'


diamond_braided_poodles = Collection.new(title: "Diamond Braided Poodles", description: "Just poodles braided with diamonds.", price: 1000, user: User.all.sample)
diamond_braided_poodles.save!


air = Collection.new(title: "Air", description: "Around 3000 litres of Alpine air collected in 23rd full moon,
  thus naturally infused with blue chakra.", price: 1500, user: User.all.sample)
air.save!

body_worlds = Collection.new(title: "Body Worlds", description: "THE medical exposition, causing controversy since three decade.", price: 4000, user: User.all.sample)
body_worlds.save!

wookie_art = Collection.new(title: "Wookie Art", description: "Wonderful, graceful artisan crafts exquisitely chewed to perfection by our furry friends", price: 350, user: User.all.sample)
wookie_art.save!

abc_collection = Collection.new(title: "ABC Collection", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ", price: 200, user: User.all.sample )
abc_collection.save!

antique_weapons = Collection.new(title: "Antique Weapons and Armours", description: "The collection is the oldest collection in the Deutsches Historisches Museum and closely connected with the history of the Zeughaus (“Armoury”). It comprises around 30,000 objects – from the Roman gladius (sword) to the Russian assault rifle Kalashnikov, from the tiny lock component of a hunting musket to the heaviest piece of artillery.", price: 1200, user: User.all.sample)
antique_weapons.save!

doorknobs = Collection.new(title: "Finest Doorknobs - By Knobby Knob", description: "doorknob, doorknob, doorknob, doorknob, doorknob, doorknob", price: 400, user: User.all.sample)
doorknobs.save!

rings = Collection.new(title: "Rings of Middle Earth", description: "Sauron, elven, human and dwarfish rings on display – DISCLAIMER: monsters might turn up and eat all attendees", price: 40000, user: User.all.sample)
rings.save!

sigmar_polke = Collection.new(title: "Sigmar Polke - Modern Art", description: "The permanent exhibition documents the history of Berlin's police force on a space of roughly 500 square metres. Among the items on display are historical uniforms, weapons and equipment. A number of firearms and tools used in actual criminal cases are also on display. I", price: 200, user: User.all.sample)
sigmar_polke.save!

hearth_stone = Collection.new(title: "Hearth Stone Collection", description: "Thousands of magical cards to place around your establishment. DISCLAIMER: Usually attracts Victor's", price: 500, user: User.all.sample)
hearth_stone.save!

michelangelo_collection = Collection.new(title: "Michelangelo's Sculptures", description: "Wonderful, graceful artisan crafts exquisitely chewed to perfection by our furry friends", price: 30000000, user: User.all.sample)
michelangelo_collection.save!


puts 'Finished!'


puts 'Creating 6 bookings'

booking_1 = Booking.new(user: User.all.sample, collection: Collection.all.sample, start_date: Faker::Date.in_date_period(year: 2020, month: 2), end_date: Faker::Date.in_date_period(year: 2020, month: 3), total_price: 4000)
booking_1.save!

booking_2 = Booking.new(user: User.all.sample, collection: Collection.all.sample, start_date: Faker::Date.in_date_period(year: 2020, month: 2), end_date: Faker::Date.in_date_period(year: 2020, month: 3, total_price: 2500))
booking_2.save!


booking_3 = Booking.new(user: User.all.sample, collection: Collection.all.sample, start_date: Faker::Date.in_date_period(year: 2020, month: 2), end_date: Faker::Date.in_date_period(year: 2020, month: 3, total_price: 6300))
booking_3.save!


booking_4 = Booking.new(user: User.all.sample, collection: Collection.all.sample, start_date: Faker::Date.in_date_period(year: 2020, month: 2), end_date: Faker::Date.in_date_period(year: 2020, month: 3, total_price: 400))
booking_4.save!


booking_5 = Booking.new(user: User.all.sample, collection: Collection.all.sample, start_date: Faker::Date.in_date_period(year: 2020, month: 2), end_date: Faker::Date.in_date_period(year: 2020, month: 3), total_price: 15000)
booking_5.save!


booking_6 = Booking.new(user: User.all.sample, collection: Collection.all.sample, start_date: Faker::Date.in_date_period(year: 2020, month: 2), end_date: Faker::Date.in_date_period(year: 2020, month: 3, total_price: 2550))
booking_6.save!

booking_7 = Booking.new(user: User.all.sample, collection: Collection.all.sample, start_date: Faker::Date.in_date_period(year: 2020, month: 2), end_date: Faker::Date.in_date_period(year: 2020, month: 3, total_price: 6440))
booking_7.save!

puts 'Finished!'

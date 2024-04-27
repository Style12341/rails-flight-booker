# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
airports = %w[katl ombd kdfw egll rjtt kden ltfm klax kord vidp wiii]
airports.each do |code|
  Airport.find_or_create_by!(code:)
end
10.times do
  airport = Airport.all.sample
  departure_date = Time.now + rand(1..100).hours
  Flight.create!(departure_airport: airport, arrival_airport: Airport.where.not(id: airport.id).sample,
                 departure_date: departure_date, arrival_date: departure_date + rand(1..10).hours)
end

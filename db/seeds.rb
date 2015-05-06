# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# To seed the database run:
#
#   rake db:seed
#
# Seed Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#
# Seed first admin user
#
case Rails.env
  when "development"
    default_admin    = 'admin@example.com'
    default_admin_pw = 'admin1234'
    puts "Development mode detected. A default admin user will be created:\n\n Username: #{default_admin}\n Password: #{default_admin_pw}\n\n"
    User.first_or_create(email: default_admin, password: default_admin_pw,password_confirmation: default_admin_pw)
  when "production"

end

#
# Seed with sample locations
#
#   Note: Each location will make a call to Google's API to geocode and fetch elevation
#
locations = {}
locations[1] = {name: 'Disney Land',        address: 'Disney Land, California' }
locations[2] = {name: 'Statue of Liberty',  address: 'Statue of Liberty in New York, USA' }
locations[3] = {name: 'Space Needle',       address: 'Space Needle, Seattle WA'}
locations[4] = {name: 'Maui, Hawaii',       address: 'Maui, Hawaii' }
locations[5] = {name: 'Golden Gate Bridge in San Francisco, California', address: 'Golden Gate Bridge in San Francisco, California' }
locations[6] = {name: 'Central Park, New York City',                     address: 'Central Park, New York City' }
locations[7] = {name: 'Walt Disney World, Epcot in Orlando Florida',     address: '200 Epcot Center Dr, Orlando, FL 32821, United States' }
locations[8] = {name: 'Caesars Palace in Las Vegas, Nevada',             address: '3570 S Las Vegas Blvd, Las Vegas, NV 89109' }
locations[9] = {name: 'Sydney Opera House in Australia',                 address: 'Sydney Opera House in Australia' }
locations[10] = {name: 'Mount Rushmore National Memorial',                address: 'Mount Rushmore National Memorial 13000 S Dakota 244 Keystone, SD 57751' }

locations.each do |key, val|
  location = Location.find_or_initialize_by(name: val[:name]) do |location|
    puts "Adding with geocoding and elevation: #{val[:name]}"
    location.name    = val[:name]
    location.address = val[:address]
  end
  location.save
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create 10 cities with Faker gem 
10.times do
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

#Create 10 fake users with Faker gem with instances of cities
10.times do |index|
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::GreekPhilosophers.quote, email: Faker::Internet.email, age: rand(17..50), city: City.find(index + 1))
end

# # Create 20 gossips linked to users
20.times do
	Gossip.create(title: Faker::Book.title, content: Faker::Quote.matz, author: User.find(rand(1..10)))
end

# # Create 10 tags
10.times do
	Tag.create(title: "##{Faker::Verb.past}")
end

# # Create relationship between tag and gossip
20.times do |index|
	JoinGossipTag.create(gossip: Gossip.find(index +1), tag: Tag.find(rand(1..10)))
end

# # Create 10 private messages
10.times do 
	PrivateMessage.create(content: Faker::GreekPhilosophers.quote, sender: User.find(rand(1..10)))
end

# # Create recipients for private messages
20.times do |index|
	RecipientList.create(private_message: PrivateMessage.find((index%10) + 1), recipient: User.find(rand(1..10)))
end


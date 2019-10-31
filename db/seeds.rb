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

nb_cities = 10
nb_users = 10
nb_gossips = 30
nb_tags = 10
nb_gossiptag = 10
nb_privmessages = 10
nb_recipientlists = 20
nb_comments = 20
nb_likes = 10

# Create 10 cities with Faker gem 
nb_cities.times do |i|
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	puts "City ##{i +1} created"
end

#Create 10 fake users with Faker gem with instances of cities
nb_users.times do |i|
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::GreekPhilosophers.quote, email: Faker::Internet.email, age: rand(17..50), city: City.find(i + 1), password: "AZERTY")
	puts "User ##{i +1} created"
end

# # # Create 20 gossips linked to users
nb_gossips.times do |i|
	Gossip.create(title: Faker::Book.title, content: Faker::Quote.matz, user: User.find(1))
	puts "Gossip ##{i +1} created"
end

# # # Create 10 tags
nb_tags.times do |i|
	Tag.create(title: "##{Faker::Verb.past}")
	puts "Tag ##{i +1} created"
end

# # # Create relationship between tag and gossip
nb_gossiptag.times do |i|
	JoinGossipTag.create(gossip: Gossip.find(i +1), tag: Tag.find(rand(1..10)))
end

# # # Create 10 private messages
nb_privmessages.times do |i|
	PrivateMessage.create(content: Faker::GreekPhilosophers.quote, sender: User.find(rand(1..10)))
	puts "PrivateMessage ##{i +1} created"
end

# # # Create recipients for private messages
nb_recipientlists.times do |i|
	RecipientList.create(private_message: PrivateMessage.find((i%10) + 1), recipient: User.find(rand(1..10)))
end

# # # Create comments for gossips
nb_comments.times do |i|
	Comment.create(user: User.find((i%10) + 1), content: Faker::Lorem.sentence(word_count: 5), gossip: Gossip.find(rand(1..20)))
	puts "Comments ##{i +1} created"
end

# # # Create likes for gossips or comments randomly
nb_likes.times do |i|
	Like.create(user: User.find((i%10) + 1), gossip: Gossip.find(rand(1..30)))
	puts "Gossip likes ##{i +1} created"
end

nb_likes.times do |i|
	Like.create(user: User.find((i%10) + 1), comment: Comment.find(rand(1..20)))
	puts "Comments likes ##{i +1} created"
end





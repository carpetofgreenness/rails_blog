# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |t|
	User.create(first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.free_email,
		password: "000")
end

10.times do |t|
	Post.create(title: Faker::Book.title,
		body: Faker::Hipster.paragraph,
		user_id: 1+ rand(5)
	)
end

20.times do |t|
	Comment.create(body: Faker::StarWars.quote,
		user_id: (rand(5)+1),
		post_id: 1+rand(10)
	)
end
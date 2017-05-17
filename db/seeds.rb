# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@example.org",
             password: "foobar")
User.create!(name:  "Example User1",
             email: "example1@example.org",
             password: "foobar")
User.create!(name:  "Example User2",
             email: "example2@example.org",
             password: "foobar")
User.create!(name:  "Example User3",
             email: "example3@example.org",
             password: "foobar")
User.create!(name:  "Example User4",
             email: "example4@example.org",
             password: "foobar")

10.times do
  User.create!(name:  Faker::StarWars.character,
               email: Faker::Internet.email,
               password: "foobar")
end
10.times do |n|
  User.first.friendships.create(friend_id: n+1, accepted: true)
  User.second.friendships.create(friend_id: n+2, accepted: true)
end

User.where(id: 2..15).each do |u|
  u.friendships.create(friend_id: u.id+1, accepted:true)
end

User.all.each do |u|
  n = rand(10) + 1
  n.times do
    x = rand(n)
    t = Time.now - x.hours
    p = u.posts.create(content: Faker::StarWars.quote)
    p.created_at = t
    p.save
  end
end

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

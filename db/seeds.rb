# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(email: 'user@example.com', password: 'password')
u2 = User.create(email: 'user2@example.com', password: 'password')
u3 = User.create(email: 'user3@example.com', password: 'password')

p1 = u1.tweet.create body: 'An Airplane')
p2 = u1.tweet.create(body: 'A Train')

p3 = u2.tweet.create(body: 'A Truck')
p4 = u2.tweet.create(body: 'A Boat')

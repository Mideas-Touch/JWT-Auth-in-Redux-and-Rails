# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "Lil Mayo", password_digest: "12345", bio: "Young handsome fellow", avatar: "white")
u2 = User.create(username: "Mayo", password_digest: "12345", bio: "Hot af", avatar: "Blcak")

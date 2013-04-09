# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
  User.create(name: "Eric", email: "e.lin@live.com", password: "cookie")
  User.create(name: "India", email: "india@meisner.com", password: "coffee")

  Product.create(name: "mango", price: 5.39)
  Product.create(name: "banana", price: 1.39)
  Product.create(name: "apple", price: 0.49)
  Product.create(name: "peach", price: 1.19)
  Product.create(name: "avocado", price: 1.00)
end
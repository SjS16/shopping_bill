# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Product.create! id: 1, name: "Banana", price: 0.49, pricing_method: 0
Product.create! id: 2, name: "Milk", price: 3.29, pricing_method: 1
Product.create! id: 3, name: "Sugar", price: 1.99, pricing_method: 1
Product.create! id: 4, name: "Apples", price: 0.99, pricing_method: 0
Product.create! id: 5, name: "Cheese", price: 9.99, pricing_method: 1
Product.create! id: 6, name: "Cumin", price: 0.55, pricing_method: 0
Product.create! id: 6, name: "Rice", price: 3.29, pricing_method: 1
Product.create! id: 6, name: "Peppers", price: 3.49, pricing_method: 0

Coupon.delete_all
Coupon.create! id: 1, code: "5OFF", discount: 5.00
Coupon.create! id: 2, code: "25OFF", discount: 25.00
Coupon.create! id: 3, code: "10OFF", discount: 10.00
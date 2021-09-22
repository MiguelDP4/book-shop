# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
  User.create!(email: 'user0@users.com', name: 'user0',password: 'asdfasdf',address: 'asdf 123',balance: 50.0,user_type: 'buyer',phone: '12312312312')
  User.create!(email: 'user1@users.com', name: 'user1',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'user2@users.com', name: 'user2',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'user3@users.com', name: 'user3',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'user4@users.com', name: 'user4',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'user5@users.com', name: 'user5',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  Book.create!(title: 'test book1',  description: 'this is a test book1', author: 'mike')
  Book.create!(title: 'test book2',  description: 'this is a test book2', author: 'mike')
  Book.create!(title: 'test book3',  description: 'this is a test book3', author: 'mike')
  Book.create!(title: 'test book4',  description: 'this is a test book4', author: 'mike')
  Book.create!(title: 'test book5',  description: 'this is a test book5', author: 'mike')
  seller = User.find_by(email: 'user1@users.com')
  seller2 = User.find_by(email: 'user2@users.com')
  seller3 = User.find_by(email: 'user3@users.com')
  seller4 = User.find_by(email: 'user4@users.com')
  seller5 = User.find_by(email: 'user5@users.com')
  new_inventory = seller.inventories.build(amount: 3, sale_price: 30.00, book_id: 1)
  new_inventory.save
  new_inventory = seller2.inventories.build(amount: 6, sale_price: 4.00, book_id: 2)
  new_inventory.save
  new_inventory = seller3.inventories.build(amount: 4, sale_price: 10.00, book_id: 3)
  new_inventory.save
  new_inventory = seller4.inventories.build(amount: 8, sale_price: 3.00, book_id: 4)
  new_inventory.save
  new_inventory = seller5.inventories.build(amount: 2, sale_price: 50.00, book_id: 5)
  new_inventory.save
  buyer = User.find_by(email: 'user0@users.com')
  buyer.cart = Cart.new(total: 0, user_id: buyer.id)
end
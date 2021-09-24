# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'production'
  User.create!(email: 'admin@users.com', name: 'admin', password: 'asdfasdf', address: 'asdf123', balance: 0, user_type: 'admin', phone: '12312312123')
end

if Rails.env == 'development'
  User.create!(email: 'admin@users.com', name: 'admin', password: 'asdfasdf', address: 'asdf123', balance: 0, user_type: 'admin', phone: '12312312123')
  User.create!(email: 'user0@users.com', name: 'user0',password: 'asdfasdf',address: 'asdf 123',balance: 50.0,user_type: 'buyer',phone: '12312312312')
  User.second.cart = Cart.new(total: 0, user_id: 2)
  User.create!(email: 'seller1@users.com', name: 'seller1',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'seller2@users.com', name: 'seller2',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'seller3@users.com', name: 'seller3',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'seller4@users.com', name: 'seller4',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  User.create!(email: 'seller5@users.com', name: 'seller5',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  Book.create!(title: 'test book1',  description: 'this is a test book1', author: 'mike')
  Book.create!(title: 'test book2',  description: 'this is a test book2', author: 'mike')
  Book.create!(title: 'test book3',  description: 'this is a test book3', author: 'mike')
  Book.create!(title: 'test book4',  description: 'this is a test book4', author: 'mike')
  Book.create!(title: 'test book5',  description: 'this is a test book5', author: 'mike')
  Book.create!(title: 'test book6',  description: 'this is a test book1', author: 'mike')
  Book.create!(title: 'test book7',  description: 'this is a test book2', author: 'mike')
  Book.create!(title: 'test book8',  description: 'this is a test book3', author: 'mike')
  Book.create!(title: 'test book9',  description: 'this is a test book4', author: 'mike')
  Book.create!(title: 'test book10',  description: 'this is a test book5', author: 'mike')
  seller = User.find_by(email:  'seller1@users.com')
  seller2 = User.find_by(email: 'seller2@users.com')
  seller3 = User.find_by(email: 'seller3@users.com')
  seller4 = User.find_by(email: 'seller4@users.com')
  seller5 = User.find_by(email: 'seller5@users.com')
  new_inventory = seller.inventories.build(amount: 35, sale_price: 3.00, book_id: 1)
  new_inventory.save
  new_inventory = seller2.inventories.build(amount: 60, sale_price: 4.00, book_id: 2)
  new_inventory.save
  new_inventory = seller3.inventories.build(amount: 40, sale_price: 7.50, book_id: 3)
  new_inventory.save
  new_inventory = seller4.inventories.build(amount: 84, sale_price: 3.75, book_id: 4)
  new_inventory.save
  new_inventory = seller5.inventories.build(amount: 26, sale_price: 2.30, book_id: 5)
  new_inventory.save
  new_inventory = seller.inventories.build(amount: 42, sale_price: 2.50, book_id: 6)
  new_inventory.save
  new_inventory = seller2.inventories.build(amount: 6, sale_price: 4.25, book_id: 7)
  new_inventory.save
  new_inventory = seller3.inventories.build(amount: 4, sale_price: 11.15, book_id: 8)
  new_inventory.save
  new_inventory = seller4.inventories.build(amount: 8, sale_price: 3.00, book_id: 9)
  new_inventory.save
  new_inventory = seller5.inventories.build(amount: 2, sale_price: 50.00, book_id: 10)
  new_inventory.save
  
end
require 'rails_helper'
require 'capybara/rspec'
include Warden::Test::Helpers
include Capybara::DSL

def generate_inventories(seller)
  10.times do |i|
    new_book = Book.new(title: "Book #{i}",  description: "Test book description #{i}", author: "Author #{i}")
    new_book.save
  end
  Book.all.each do |book|
    new_inventory = seller.inventories.build(amount: rand(1..100), sale_price: rand(2..50), book_id: book.id)
    new_inventory.save
  end
end

def generate_seller
  seller = User.new(email: 'seller1@users.com',
                    name: 'seller1',
                    password: 'asdfasdf',
                    address: 'asdf 123',
                    balance: 0.0,
                    user_type: 'seller',
                    phone: '12312312312')
  seller.save
  seller
end

describe "GET inventory#index" do
    seller = generate_seller
    generate_inventories(seller)

    login_as(seller, scope: :user)
    inventories = seller.inventories

    it "should get the first 5 books in the user's inventory" do
      visit "/inventory/index"
      inventories.first(5).each do |inventory|
        expect(page).to have_content(inventory.book.title)
      end
    end
    

end


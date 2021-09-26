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

RSpec.describe '/inventory', type: :request do

  describe 'GET /index' do
    it 'renders a successful response' do
      current_user = generate_seller
      login_as(current_user, scope: :user)
      get inventory_index_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      current_user = generate_seller
      login_as(current_user, scope: :user)
      get inventory_new_path
      expect(response).to be_successful
    end
  end

  describe 'PUT /update' do
    context 'with valid parameters' do
      it 'updates the requested inventory' do
        current_user = generate_seller
        login_as(current_user, scope: :user)

        new_book = Book.new(title: "Book",  description: "Test book description", author: "Author")
        new_book.save

        new_inventory = current_user.inventories.build(amount: rand(1..100), sale_price: rand(2..50), book_id: new_book.id)
        new_inventory.save

        inventory = current_user.inventories.first
        put inventory_update_url, params: { amount: 42, sale_price: 21, inventory_id: 1 }
        inventory.reload
        expect(inventory.amount).to eq 42
        expect(inventory.sale_price).to eq 21
      end

      it 'redirects to the inventory index' do
        current_user = generate_seller
        login_as(current_user, scope: :user)

        new_book = Book.new(title: "Book",  description: "Test book description", author: "Author")
        new_book.save

        new_inventory = current_user.inventories.build(amount: rand(1..100), sale_price: rand(2..50), book_id: new_book.id)
        new_inventory.save

        inventory = current_user.inventories.first
        put inventory_update_url, params: { amount: 42, sale_price: 21, inventory_id: 1 }
        inventory.reload
        expect(response).to redirect_to(inventory_index_path)
      end
    end
  end

  describe "POST /create" do
    it "creates a new inventory" do
      current_user = generate_seller
      login_as(current_user, scope: :user)
      expect do
        post inventory_create_url, params: { title: "Title X", description: "Description Y",author: "Author Z",amount: 20,sale_price: 32.5 }
      end.to change(Inventory, :count).by(1)
    end
  end
end
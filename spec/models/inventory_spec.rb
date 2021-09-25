require 'rails_helper'

RSpec.describe Inventory, :type => :model do
  u = User.new(email: 'seller@users.com', name: 'seller1',password: 'asdfasdf',address: 'asdf 123',balance: 0.0,user_type: 'seller',phone: '12312312312')
  b = Book.new(title: 'test book1',  description: 'this is a test book1', author: 'mike')
  u.save
  b.save
  subject { 
    described_class.new(
    user_id: u.id,
    book_id: b.id,
    amount: 10,
    sale_price: 20.00)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a book_id" do
    subject.book_id = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without sale price" do
    subject.sale_price = nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the sale price is lower than $1" do
    subject.sale_price = 0.5
    expect(subject).to_not be_valid
  end
  it "is not valid if the sale price is greater or equal than $50" do
    subject.sale_price = 60
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end
end
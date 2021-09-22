class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user, optional: true

  def add_cart_item(inventory_id, amount)
    inventory = Inventory.find(inventory_id)
    if inventory.amount > 0 and amount <= inventory.amount
      new_cart_item = self.cart_items.build(
        amount: amount,
        sale_price: inventory.sale_price,
        inventory_id: inventory.id
      )
      new_cart_item.save
      calculate_total
      self.save
    end
  end

  def remove_cart_item(cart_item_id, amount)
    cart_item = self.cart_items.find(cart_item_id)
    if amount == cart_item.amount
      cart_item.delete
    else
      cart_item.amount -= amount
    end
    calculate_total
    cart_item.save
    self.save
  end

  def calculate_total
    total_sum = 0
    if self.cart_items.length > 0
      self.cart_items.each do |item|
        total_sum += item.amount * item.sale_price
      end
      self.total = total_sum
      self.save
    else
      self.total = 0
      self.save
    end
  end
end

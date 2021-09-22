class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user, optional: true

  def add_cart_item(inventory_id, amount)
    inventory = Inventory.find(inventory_id)
    cart_item = self.cart_items.find_by(inventory_id: inventory_id)
    if inventory.amount > 0 and amount <= inventory.amount
      if cart_item
        cart_item.amount += amount
        cart_item.save

        inventory.amount -= amount
        inventory.save
      else
        cart_item = self.cart_items.build(
          amount: amount,
          sale_price: inventory.sale_price,
          inventory_id: inventory.id
        )

        inventory.amount -= amount
        inventory.save

        cart_item.save
      end
      calculate_total
      self.save
      return true
    end
    return false
  end

  def remove_cart_item(cart_item_id, amount)
    cart_item = self.cart_items.find_by(id: cart_item_id)
    if cart_item
      if amount == cart_item.amount
        cart_item.delete
      else
        cart_item.amount -= amount
      end
    end
    inventory = Inventory.find(cart_item.inventory_id)
    inventory.amount += amount
    inventory.save

    cart_item.save
    self.save
    calculate_total
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

  def clear_cart
    CartItem.where(cart_id: self.id).destroy_all
  end
end

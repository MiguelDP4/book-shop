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

  def process_sale
    buyer = self.user
    admin_user = User.find_by(user_type: 'admin')
    cart_items = self.cart_items
    #checking first if user has enough to buy
    if buyer.balance >= self.total
      #going through items in cart to make a distinct sale for inventory owners
      cart_items.each do |c|
        new_sale = Sale.new(
                            amount: c.amount,
                            unit_price: c.inventory.sale_price,
                            user_id: c.cart.user_id,
                            inventory_id: c.inventory_id
                            )
        seller_user = User.find(c.inventory.user_id)
        # generating payment for sellers and adding $1 per book sold to admin account
        # charging buyer with book cost
        buyer.balance -= c.amount * c.inventory.sale_price
        seller_user.balance += (c.inventory.sale_price - 1) * c.amount
        admin_user.balance += c.amount
        seller_user.save
        buyer.save
        admin_user.save
        new_sale.save
      end
      buyer.cart.clear_cart_after_purchase
    else
      flash[:danger] = "You don't have enough balance to pay for this order."
      return false
    end
  end

  def clear_cart_after_purchase
    CartItem.where(cart_id: self.id).destroy_all
  end
end

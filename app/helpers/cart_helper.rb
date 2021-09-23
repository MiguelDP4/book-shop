module CartHelper
  def cart_items
    count = 0
    current_user.cart.cart_items.each do |i|
      count += i.amount
    end
    count
  end
end

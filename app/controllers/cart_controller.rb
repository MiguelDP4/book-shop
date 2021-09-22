class CartController < ApplicationController
  def index
    @cart_items = current_user.cart.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:cart_item_id])
    new_amount = params[:amount].to_i
    if new_amount > @cart_item.amount
      add = new_amount - @cart_item.amount
      unless @cart_item.cart.add_cart_item(@cart_item.inventory_id, add)
        flash[:danger] = "There's no more stock to add to your cart"
      end
    else
      subtract = @cart_item.amount - new_amount
      @cart_item.cart.remove_cart_item(@cart_item.id, subtract)
    end
    redirect_to request.referrer
  end

  def delete
    @cart_item = CartItem.find(params[:cart_item_id])
    if @cart_item.delete
      redirect_to request.referrer
    else
      flash[:danger] = "There's no more stock to add to your cart"
    end

  end
end

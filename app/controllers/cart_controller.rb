class CartController < ApplicationController
  before_action :logged_in_user, only: %i[index update delete]

  def index
    @cart_items = current_user.cart.cart_items
    if @cart_items.count == 0
      flash.now[:info] = "Your shopping cart is empty. Go get some books." 
    end
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

  def add_to_cart
    if user_signed_in?
      current_user.cart.add_cart_item(params[:inventory_id],1)
      redirect_to request.referrer
    else
      redirect_to root_path
    end
  end

  def purchase
    cart = current_user.cart
    if cart.process_sale
      flash[:success] = "You've purchased your books, wait for your order to arrive at your address"
      redirect_to root_path
    else
      redirect_to request.referrer
    end
  end

  def delete
    @cart_item = CartItem.find(params[:cart_item_id])
    if @cart_item.delete
      redirect_to request.referrer
    else
      flash[:danger] = "There's no more stock to add to your cart"
    end

  end

  private

  def logged_in_user
    flash[:danger] = 'Log in first to be able to create articles.' unless user_signed_in?
    redirect_to new_user_session_url unless user_signed_in?
  end
end

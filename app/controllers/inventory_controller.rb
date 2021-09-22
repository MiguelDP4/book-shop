class InventoryController < ApplicationController
  before_action :logged_in_user, only: %i[add_to_cart]
  
  def add_to_cart
    if user_signed_in?
      current_user.cart.add_cart_item(params[:inventory_id],1)
    else
      redirect_to root_page
    end
  end

  private

  def logged_in_user
    flash[:danger] = 'Log in first to be able to create articles.' unless user_signed_in?
    redirect_to new_user_session_url unless user_signed_in?
  end
end

class SaleController < ApplicationController
  def index
    if current_user.user_type == 'admin'
      @sales = Sale.all
    elsif current_user.user_type == 'buyer'
      @sales = Sale.where(user_id: current_user.id)
    elsif current_user.user_type == 'seller'
      @sales = Sale.joins(:inventory).where('inventories.user_id = ?', current_user.id)
    end
    @sales = @sales.page(params[:page])
  end
end

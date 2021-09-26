class InventoryController < ApplicationController
  before_action :logged_in_user, only: %i[add_to_cart index]
  
  def index 
    @books = Kaminari.paginate_array(current_user.inventories).page(params[:page])
  end

  def update
    @inventory = Inventory.find(params[:inventory_id])
    @inventory.update(inventory_params)
    redirect_to request.referrer
  end

  def new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      @inventory = current_user.inventories.build(inventory_params)
      @inventory.book_id = @book.id
      if @inventory.save
        redirect_to inventory_index_path
      else
        error_messages = @inventory.errors.objects.map {|o| o.full_message}
        flash[:danger] = error_messages.flatten
        redirect_to request.eferrer
      end
    else
      error_messages = @book.errors.objects.map {|o| o.full_message}
      flash[:danger] = error_messages.flatten
      redirect_to request.referrer
    end
  end

  private

  def logged_in_user
    flash[:danger] = 'Log in first to be able to create articles.' unless user_signed_in?
    redirect_to new_user_session_url unless user_signed_in?
  end

  def inventory_params
    params.permit(:amount, :sale_price)
  end

  def book_params
    params.permit(:title, :description, :author)
  end
end

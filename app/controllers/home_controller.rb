class HomeController < ApplicationController
  def index
    search_term = params[:search_term]
    search_type = params[:search_type]
    if search_term
      case search_type
        when 'title'
          @inventories = Inventory.joins(:book)
          .where('lower(books.title) LIKE ?', "%#{search_term.downcase}%")
        when 'description'
          @inventories = Inventory.joins(:book)
          .where('lower(books.description) LIKE ?', "%#{search_term.downcase}%")
        when 'author'
          @inventories = Inventory.joins(:book)
          .where('lower(books.author) LIKE ?', "%#{search_term.downcase}%")
        when 'seller'
          @inventories = Inventory.joins(:user)
          .where('lower(users.name) LIKE ?', "%#{search_term.downcase}%")
      end
    else
      @inventories = Inventory.all
    end
    @inventories = @inventories.page(params[:page])
  end
end

class HomeController < ApplicationController
  def index
    @inventories = Inventory.all
  end
end

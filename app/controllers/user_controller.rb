class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @inventories = @user.inventories
  end
end

class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items.order('created_at DESC')
    @orders = Order.includes(:user, :item)
  end
end

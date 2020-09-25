class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items.order('created_at DESC')
    @good_items = @items.where('checked LIKE ? ', true)
    @orders = Order.includes(:user, :item)
  end
end

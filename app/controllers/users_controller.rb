class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items.order('created_at DESC')
    @good_items = Item.all.order('created_at DESC').where('checked LIKE ? ', true)
    @orders = Order.includes(:user, :item)
  end
end

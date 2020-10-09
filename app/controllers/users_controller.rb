class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @nickname = current_user.nickname
    @items = current_user.items.order('created_at DESC')
    @p_orders = Order.all.where(user_id: current_user.id).select('item_id')
    @p_items = Item.all.where(id: @p_orders)
    @good_items = Item.all.order('created_at DESC').where('checked LIKE ? ', true)
    @orders = Order.includes(:user, :item)
  end
end

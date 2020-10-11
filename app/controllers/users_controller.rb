class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @nickname = current_user.nickname
    @orders = Order.includes(:user, :item)
    @items = current_user.items.order('created_at DESC')
    @favorites = Favorite.all
    # 購入一覧
    p_orders = Order.all.where(user_id: current_user.id).select('item_id')
    @p_items = Item.all.order('created_at DESC').where(id: p_orders)
    # /購入一覧
    # お気に入り
    favorite = Favorite.where(user_id: current_user.id).select('item_id')
    @f_items = Item.all.order('created_at DESC').where(id: favorite)
    # /お気に入り
  end
end

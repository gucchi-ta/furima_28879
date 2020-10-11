class FavoritesController < ApplicationController

  def create
    # binding.pry
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save
    # redirect_to item_path(favorite.item_id)
  end

  def destroy
    # binding.pry
    @item = Item.find(params[:item_id])
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    # redirect_to item_path(favorite.item_id)
  end

end

class ItemsController < ApplicationController
   before_action :move_to_index, except: [:index, :show]
   
   def index
      @items = Item.includes(:user).order("created_at DESC")
      @orders = Order.includes(:user, :item)
   end
   
   def new
      @item = Item.new
   end
   
   def create
      @item = Item.new(item_params)
      if @item.save
         redirect_to root_path
      else
         render :new
      end
   end

   def show
      @item = Item.find(params[:id])
      @orders = Order.includes(:user, :item)
   end

   private

   def item_params
      params.require(:item).permit(:image, :item_name, :text, :category_id, :product_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
   end

   def move_to_index
      unless user_signed_in?
         redirect_to action: :index
      end
   end

end

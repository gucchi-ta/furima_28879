class ItemsController < ApplicationController
   
   def index
   end
   
   def move_to_index
      unless user_signed_in?
         redirect_to action: :index
      end
   end

   def new
      @item = Item.new
   end
   
   def create
      @item = Item.new(item_params)
   end

   private

   def item_params
      params.require(:item).permit(:image, :item, :text, :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
   end

end

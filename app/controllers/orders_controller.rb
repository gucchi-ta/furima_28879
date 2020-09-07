class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:id])
  end

  def create
    @order = OrderAddress.new(order_params)
    @item = Item.find(params[:id])
    if @order.valid?
      @order.save
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone)
          .merge(user_id: current_user.id, token: params[:token], item_id: params[:id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    amount = @item.price
    Payjp::Charge.create(
      amount: amount,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

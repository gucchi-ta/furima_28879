class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:prefecture_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:id])
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

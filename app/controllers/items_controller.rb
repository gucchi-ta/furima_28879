class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show, :search]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @orders = Order.includes(:user, :item)
    # @item_tag = ItemTag.search(params[:keyword])
  end

  def new
    @item = Item.new
    @tag = Tag.new
    @items =  ItemTag.new
  end

  def create
    @item = Item.new
    @tag = Tag.new
    @items = ItemTag.new(item_params)
    if @items.valid?
      @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # binding.pry
    @item = Item.find(params[:id])
    @tag = @item.item_tag_relations[0].tag
    @orders = Order.includes(:user, :item)
    # @items =  ItemTag.find(params[:id])
    @message = Message.new
    @messages = @item.messages.includes(:user)
  end

  def edit
    @item = Item.find(params[:id])
    @tag = @item.item_tag_relations[0].tag
    @items =  ItemTag.new
  end

  def update
    binding.pry
    @item = Item.find(params[:id])
    @tag = @item.item_tag_relations[0].tag
    @items =  ItemTag.new(item_params)
    # FoemオブジェクトでActiveStprageの紐付けがきれてしまうので@item.image.blobで取得したものを代入
    if @items.image == nil
      @items.image = @item.image.blob
    end
    ## FoemオブジェクトでActiveStprageの紐付けがきれてしまうので@item.image.blobで取得したものを代入
    if @items.valid?
      @items.update(params[:id])
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @item = Item.search(params[:keyword])
    @orders = Order.includes(:user, :item)
  end

  def incre_search
    return nil if params[:input] == ""
    @tags = Tag.where(['tag_name LIKE ?', "%#{params[:input]}%"] )
    render json:{ incre_keyword: @tags }
  end

  def tag
    return nil if params[:input] == ""
    @tags = Tag.where(['tag_name LIKE ?', "%#{params[:input]}%"] )
    render json:{ incre_keyword: @tags }
  end

  private

  def item_params
    p_tag_name = params[:item][:tag][:tag_name]
    params.require(:item).permit(:image, :item_name, :text, :category_id, :product_status_id,
                                 :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, 
                                 :price, :tag_name, :_destroy, :id, tag: {})
                         .merge(user_id: current_user.id, tag_name: p_tag_name)
  end

  def item_destroy_params
    params.require(:item).permit(:image, :item_name, :text, :category_id, :product_status_id,
                                 :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, 
                                 :price, :_destroy, :id)
                         .merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

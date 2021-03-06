class ItemTag
  include ActiveModel::Model
  attr_accessor :image, :item_name, :text, :category_id, :product_status_id, :shipping_fee_status_id,
                :prefecture_id, :scheduled_delivery_id, :price, :tag_name, :item_id, :tag_id, :user_id, :tag, :id

  # 空のデータを保存できないようにする
  validates :image, :item_name, :text, presence: true
  # priceの範囲を¥300~¥9,999,999の間に設定,また半角数字しか保存できないようにする
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :product_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id,
            numericality: { other_than: 1 }

  # 以下各メソッド定義
  def save
    item = Item.create(image: image, item_name: item_name, text: text, category_id: category_id,
                       product_status_id: product_status_id, shipping_fee_status_id: shipping_fee_status_id,
                       prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id,
                       price: price, user_id: user_id)

    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params)
    item = Item.find(params)
    tag = item.item_tag_relations[0].tag
    item.update(image: image, item_name: item_name, text: text, category_id: category_id, product_status_id: product_status_id,
                shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id,
                scheduled_delivery_id: scheduled_delivery_id, price: price, user_id: user_id)

    tag.update(tag_name: tag_name)
    # ItemTagRelation.update(item_id: item_id, tag_id: tag_id)
  end

  def destroy(params)
    item = Item.find(params)
    item.destroy(image: image, item_name: item_name, text: text, category_id: category_id, product_status_id: product_status_id,
                 shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id,
                 scheduled_delivery_id: scheduled_delivery_id, price: price, user_id: user_id)

    # ItemTagRelation.update(item_id: item_id, tag_id: tag_id)
  end

  def find(params)
    item = Item.find(params)
    tag = item.item_tag_relations[0].tag
    @items = [item, tag]
  end
  # /ここまで各メソッド定義
end

class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # Active Hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  #空の投稿を保存できないようにする
  validates :item_name, :text, :category, :product_status, :shipping_fee, :prefecture, :scheduled_delivery, :price, presence: true
   #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :product_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 } 

  
end

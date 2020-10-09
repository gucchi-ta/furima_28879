class Item < ApplicationRecord
  belongs_to :user
  has_one :order, dependent: :destroy
  has_one_attached :image
  has_many :tags, through: :item_tag_relations
  has_many :item_tag_relations, dependent: :destroy
  has_many :messages, dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :item_tag_relations, allow_destroy: true

  # Active Hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  # 空のデータを保存できないようにする
  validates :image, :item_name, :text, presence: true
  # priceの範囲を¥300~¥9,999,999の間に設定,また半角数字しか保存できないようにする
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :product_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id,
            numericality: { other_than: 1 }

  # searchメソッドの定義
  def self.search(search)
    if search != ''
      Item.joins(item_tag_relations: [:tag])
          .where('item_name LIKE(?) or text LIKE(?) or tag_name LIKE(?) ', "%#{search}%", "%#{search}%", "%#{search}%")
          .order('created_at DESC')
      # Item.joins(item_tag_relations: [:tag]).where('tag_name LIKE(?)', "%#{search}%")
    else
      Item.all.order('created_at DESC')
    end
  end
end

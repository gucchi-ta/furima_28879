class Address < ApplicationRecord
  belongs_to :order

  # active_hashの読み込み / バリデーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: tue do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :telephone, format: { with: /\d{11}/ }
  end
end

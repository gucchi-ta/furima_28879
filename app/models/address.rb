class Address < ApplicationRecord
  # アソシエーション
  belongs_to :order

  # active_hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end

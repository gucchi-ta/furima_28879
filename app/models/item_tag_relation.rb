class ItemTagRelation < ApplicationRecord
  # アソシエーション
  belongs_to :item
  belongs_to :tag
end

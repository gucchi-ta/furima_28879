class Tag < ApplicationRecord
  has_many :items, through: :item_tag_relations, dependent: :destroy
  has_many :item_tag_relations, dependent: :destroy

  accepts_nested_attributes_for :item_tag_relations, allow_destroy: true
end

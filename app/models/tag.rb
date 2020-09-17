class Tag < ApplicationRecord
  has_many :items, through :item_tag_relation, dependent: :destroy

  validates :name, presence: true
end

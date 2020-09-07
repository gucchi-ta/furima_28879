class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture_id, numericality: { other_than: 1 }

  validates :token, presence: true
  attr_accessor :token
end

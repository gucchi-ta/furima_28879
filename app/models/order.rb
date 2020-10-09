class Order < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy

  # バリデーション
  validates :token, presence: true
  attr_accessor :token
end

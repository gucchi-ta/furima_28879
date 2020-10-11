class Message < ApplicationRecord
  # アソシエーション
  belongs_to :item
  belongs_to :user

  validates :message, presence: true
end

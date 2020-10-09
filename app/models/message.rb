class Message < ApplicationRecord
  # アソシエーション
  belongs_to :item
  belongs_to :user
end

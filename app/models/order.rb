class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  validates :token, presence: true
  attr_accessor :token
end

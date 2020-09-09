class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :user_id, :item_id
  attr_accessor :token

  # prefectureバリデーション
  validates :prefecture_id, format: { with: /[2-9]|[1-4][0-8]/, message: 'Select' }
  # tokenバリデーション
  validates :token, presence: true
  # その他address情報バリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :telephone, format: { with: /\d/ }
  end

  def save
    # 購入情報(親テーブル)の情報を保存し、変数orderに代入
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    # 住所(子テーブル)の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, telephone: telephone, order_id: order.id)
  end
end

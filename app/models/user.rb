class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :nickname, presence: true
  validates :birthday, presence: true
  
  # パスワードのバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX}, length: { minimum: 6 }

  #ユーザー本名のバリデーション
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end

  #ユーザー本名フリガナのバリデーション
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :first_kana
    validates :last_kana
  end

end
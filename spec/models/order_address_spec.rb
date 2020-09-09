require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#crreate' do
    before do
      @order = FactoryBot.build(:order_address)
    end
    describe '商品購入機能' do
      context '購入機能がうまくいく時' do
        it '全ての値が正しく入力されていると購入できる' do
          expect(@order).to be_valid
        end
        it '建物名が入力されていなくても購入できる' do
          @order.building_name = nil
          expect(@order).to be_valid
        end
      end
      context '購入機能がうまくいかない時' do
        it 'カード情報が存在しない/もしくは正しくないとトークンが生成されず購入できない' do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
        it '郵便番号が存在しないと購入できない' do
          @order.postal_code = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
        end
        it '郵便番号が正しい書き方でないと購入できない' do
          @order.postal_code = '1234567'
          @order.valid?
          expect(@order.errors.full_messages).to include('Postal code is invalid')
        end
        it '都道府県が選択されていないと購入できない' do
          @order.prefecture_id = 1
          @order.valid?
          expect(@order.errors.full_messages).to include('Prefecture Select')
        end
        it '市町村が存在しないと購入できない' do
          @order.city = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end
        it '番地が存在しないと購入できない' do
          @order.house_number = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("House number can't be blank")
        end
        it '電話番号が存在しないと購入できない' do
          @order.telephone = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Telephone can't be blank", 'Telephone is invalid')
        end
        it '電話番号が正しい書き方でないと購入できない' do
          @order.telephone = 'ああ'
          @order.valid?
          expect(@order.errors.full_messages).to include("Telephone is invalid")
        end
        it '電話番号が11文字より大きいと購入できない' do
          @order.telephone = '111111111111'
          @order.valid?
          expect(@order.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
        end
      end
    end
  end
end

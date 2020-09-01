require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/sample.jpg')
    end

    describe '商品出品機能' do
      context '商品が出品できる時' do
        it "画像や値が全て存在し、プルダウンが全て選択されていれば保存できる" do
          expect(@item).to be_valid
        end
      end
      context '商品が出品できない時' do
        it "imageが存在しない時は保存できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "item_nameが存在しない時は保存できない" do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it "textが存在しない時は保存できない" do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it "categoryが選択されていない時は保存できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end
        it "product_statusが選択されていない時は保存できない" do
          @item.product_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product status Select")
        end
        it "shipping_fee_statusが選択されていない時は保存できない" do
          @item.shipping_fee_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee status Select")
        end
        it "prefectureが選択されていない時は保存できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture Select")
        end
        it "scheduled_deliveryが選択されていない時は保存できない" do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery Select")
        end
        it "priceが存在しない時は保存できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price Half-width number", "Price is invalid")
        end
        it "priceが半角数字でなければ保存できない" do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Half-width number")
        end
        it "priceが300より小さいと保存できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "priceが9999999より大きいと保存できない" do
          @item.price = 19999999
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end
    end
  end
end

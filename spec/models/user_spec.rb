require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー登録機能' do
      context 'ユーザー登録機能がうまくいく時' do
        it "値が全て存在すれば登録できる" do
          
        end
        it "passwordが6文字以上なら登録できる" do
          
        end
        it "本名が全角かな/カナ漢字なら登録できる" do
          
        end
        it "本名フリガナがカタカナなら登録できる" do
          
        end
      end
      context 'ユーザー登録機能がうまくいかない時' do
        it "nicknameが空だと登録できない" do
          
        end
        it "emailが空だと登録できない" do
          
        end
        it "重複したemailが存在する場合登録できない" do
          
        end
        it "passwordが空だと登録できない" do
          
        end
        it "passwordが5文字以下だと登録できない" do
          
        end
        it "passwordがあってもpassword_confirmationが空だと登録できない" do
          
        end
        it "first_nameが空だと登録できない" do
          
        end
        it "first_nameが英数字だと登録できない" do
          
        end
        it "last_nameが空だと登録できない" do
          
        end
        it "last_nameが英数字だと登録できない" do
          
        end
        it "first_kanaが空だと登録できない" do
          
        end
        it "first_kanaが英数字か全角かな漢字だと登録できない" do
          
        end
        it "last_kanaが空だと登録できない" do
          
        end
        it "last_kanaが英数字か全角かな漢字だと登録できない" do
          
        end
      end
    end
  end
end
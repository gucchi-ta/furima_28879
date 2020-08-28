require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー登録機能' do
      context 'ユーザー登録機能がうまくいく時' do
        it "値が全て存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it "passwordが6文字以上の英数字なら登録できる" do
          @user.password = "111aaa"
          @user.password_confirmation = "111aaa"
          expect(@user).to be_valid
        end
        it "本名が全角かな/カナ漢字なら登録できる" do
          @user.first_name = "仮名"
          @user.last_name = "仮名"
          expect(@user).to be_valid
        end
        it "本名フリガナがカタカナなら登録できる" do
          @user.first_kana = "カナ"
          @user.last_kana = "カナ"
          expect(@user).to be_valid
        end
      end
      context 'ユーザー登録機能がうまくいかない時' do
        it "nicknameが空だと登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空だと登録できない" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.invalid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空だと登録できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password is too short (minimum is 6 characters)", "Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下だと登録できない" do
          @user.password = "111aa"
          @user.password_confirmation = "111aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is too short (minimum is 6 characters)")
        end
        it "passwordが英字のみだと登録できない" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが数字のみだと登録できない" do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordがあってもpassword_confirmationが空だと登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "本名が空だと登録できない" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
        end
        it "first_nameが英数字だと登録できない" do
          @user.first_name = "aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it "last_nameが空だと登録できない" do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
        end
        it "last_nameが英数字だと登録できない" do
          @user.last_name = "aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        it "first_kanaが空だと登録できない" do
          @user.first_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana can't be blank", "First kana is invalid")
        end
        it "first_kanaが英数字か全角かな漢字だと登録できない" do
          @user.first_kana = "仮名"
          @user.valid?
          expect(@user.errors.full_messages).to include("First kana is invalid")
        end
        it "last_kanaが空だと登録できない" do
          @user.last_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana can't be blank", "Last kana is invalid")
        end
        it "last_kanaが英数字か全角かな漢字だと登録できない" do
          @user.last_kana = "仮名"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last kana is invalid")
        end
      end
    end
  end
end
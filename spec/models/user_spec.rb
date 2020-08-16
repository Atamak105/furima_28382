require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context "ユーザー登録がうまくいくとき" do
      it "全て入力すれば登録ができること" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録ができること" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
    end

    context "ユーザー登録がうまくいかないとき" do
      it "nicknameが空だと登録ができないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録ができないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録ができないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken") 
      end
      it "emailに＠が含まれていないと登録できないこと" do
        @user.email = "email.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
        it "passwordが空だと登録ができないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数混合でないと登録ができないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録ができないこと" do
        @user.password_confirmation = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録ができないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空だと登録ができないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameは全角日本語でないと登録ができないこと" do
        @user.first_name = "EDOGAWA"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameは全角日本語でないと登録ができないこと" do
        @user.last_name = "KONAN"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_readingが空だと登録ができないこと" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "last_name_readingが空だと登録ができないこと" do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end
      it "first_name_readingが全角カタカナでないと登録ができないこと" do
        @user.first_name_reading = "ｴﾄﾞｶﾞﾜ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "last_name_readingが全角カタカナでないと登録ができないこと" do
        @user.last_name_reading = "ｺﾅﾝ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end
      it "birthdayが空だと登録ができないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end

end

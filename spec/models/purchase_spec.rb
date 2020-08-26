require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "商品購入機能" do
    before do
      @purchase = FactoryBot.build(:purchase)
      @purchase.token = ('1234qwer')
    end

    context "購入がうまく行くとき" do
      it "全て入力すれば購入ができること" do
        expect(@purchase).to be_valid
      end
    end

    context "購入がうまくいかないとき" do
      it "tokenが空だと購入できないこと" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと購入できないこと" do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンが入っていないと購入できないこと" do
        @purchase.postal_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeは8桁以内でないと購入できないこと" do
        @purchase.postal_code = "123-45678"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is too long (maximum is 8 characters)")
      end
      it "area_idが空だと購入できないこと" do
        @purchase.area_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area can't be blank")
      end
      it "cityが空だと購入できないこと" do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと購入できないこと" do
        @purchase.address = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "telが空だと購入できないこと" do
        @purchase.tel = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel can't be blank", "Tel is not a number")
      end
      it "telにハイフンが入っていると購入できないこと" do
        @purchase.tel = "090-1111-1111"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel is not a number", "Tel is too long (maximum is 11 characters)")
      end
      it "telは11桁以内でないと購入できないこと" do
        @purchase.tel = "090123456789"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end
    end
  end
end

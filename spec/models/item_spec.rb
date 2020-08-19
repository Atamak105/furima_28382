require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/test_image.png')
    end

    context "商品出品がうまくいくとき" do
      it "全て入力すれば出品ができること" do
        expect(@item).to be_valid
      end
    end

    context "商品出品がうまくいかないとき" do
      it "imageが１枚添付されていないと出品できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できないこと" do
        @item.name = nil
        @item.valid?

        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空だと出品できないこと" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空だと出品できないこと" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "status_idが空だと出品できないこと" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "shipping_charges_idが空だと出品できないこと" do
        @item.shipping_charges_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it "area_idが空だと出品できないこと" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "delivery_idが空だと出品できないこと" do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it "priceが空だと出品できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceの範囲が300円未満だと出品できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceの範囲が9,999,999円を超過していると出品できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

    end

  end

end


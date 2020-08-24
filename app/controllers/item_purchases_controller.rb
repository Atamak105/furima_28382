class ItemPurchasesController < ApplicationController
  before_action :set_item, only: [:index, :new, :create, :pay_item]

  def index
    # @item = Item.find(params[:item_id])
  end

  def new
    @purchase = Purchase.new
    # @item = Item.find(params[:item_id])
  end

  def create

    @purchase = Purchase.new(purchase_params)
    # @item = Item.find(params[:item_id])
  
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :new
    end
  
  end

  # def done
  #   @item_purchaser = Item.find(params[:item_id])
  #   @item_purchaser.update( user_id: current_user.id)
  # end



  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:item_id, :price, :postal_code, :area_id, :city, :address, :building, :tel).merge(user_id: current_user.id)
  end

  # PAY.JPで支払い情報を生成するオブジェクト
  def pay_item
    # @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_d406d2c8f1467a013527cd5b"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end

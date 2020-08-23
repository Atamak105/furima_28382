class ItemPurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private


  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_d406d2c8f1467a013527cd5b"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end

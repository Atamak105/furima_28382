class ItemPurchasesController < ApplicationController
  before_action :move_to_login
  before_action :set_item, only: [:index, :new, :create, :pay_item, :not_user, :not_buy]
  before_action :not_user
  before_action :not_buy

  def index
  end

  def new
    @purchase = Purchase.new
  end

  def create

    @purchase = Purchase.new(purchase_params)
  
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :new
    end
  
  end

  def done
    @item_buyer = Item.find(params[:item_id])
    @item_buyer.update( user_id: current_user.id)
  end



  private

  # ログインしていない場合ログイン画面に遷移する
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # 出品者は自分の出品商品購入画面へアクセスできない
  def not_user
    if current_user.id == @item.user_id
      redirect_to item_path(@item.id)
    end
  end

  # 購入済商品は購入できない
  def not_buy
    if ItemPurchase.exists?(item: @item)
      redirect_to root_path
    end
  end

  def purchase_params
    params.permit(:item_id, :price, :postal_code, :area_id, :city, :address, :building, :tel, :token).merge(user_id: current_user.id)
  end

  # PAY.JPで支払い情報を生成するオブジェクト
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end

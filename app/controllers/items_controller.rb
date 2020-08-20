class ItemsController < ApplicationController
   before_action :move_to_login, except: :index

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order(id: "DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charges_id, :area_id, :delivery_id, :price).merge(user_id: current_user.id) #image_id: current_user.image_id
  end
  
  # ログインしていない場合ログイン画面に遷移する
  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

end

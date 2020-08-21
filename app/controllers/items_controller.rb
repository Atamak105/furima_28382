class ItemsController < ApplicationController
   before_action :move_to_login, except: [:index, :show]
   before_action :set_message, only: [:show, :edit, :update]

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

  def set_message
    @item = Item.find(params[:id])
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
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
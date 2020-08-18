class ItemsController < ApplicationController
  # ログインしていない場合TOPに戻る
  # before_action :move_to_index, except: :index

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :shipping_charges_id, :area_id, :delivery_id, :price).merge(user_id: current_user.id) #image_id: current_user.image_id
  end
  



end

class FavoritesController < ApplicationController
  before_action :set_item

  def create
    if @item.user_id != current_user.id 
    @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id)
    flash[:success] = 'お気に入り登録されました'
    redirect_to item_path(@item)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id,item_id: @item.id)
    @favorite.destroy 
    redirect_to item_path, notice: 'お気に入り解除されました'
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end

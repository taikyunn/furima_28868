class FavoritesController < ApplicationController
  before_action :set_item

  def create
    if @item.user_id != current_user.id 
    @favorite = Favorite.create( user_id: current_user.id, item_id: @item.id)
    redirect_to root_path
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id,item_id: @item.id)
    @favorite.destroy 
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end

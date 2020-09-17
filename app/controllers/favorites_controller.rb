class FavoritesController < ApplicationController
  before_action :set_params

  def create
    if Favorite.create(user_id: user.id,item_id:item.id)
    redirect_to root_path
    else

    end
  end

  def destroy
    if favorite = Favorite.find_by(user_id: user.id,item_id:item.id)
      favorite.delete
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def set_params
    params.require(:favorite).merge(user_id: current_user.id, item_id: @item.id)
  end
end
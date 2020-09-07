class PurchasesController < ApplicationController

  def index
    binding.pry
    @item = Item.find(items_params)
  end

  private

  def items_params
    params.require(:item).permit(:image, :title, :introduction, :category_id, :status_id, :postage_id, :area_id, :shipping_id, :price).merge(user_id: current_user.id)
  end
end

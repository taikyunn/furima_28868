class ItemsController < ApplicationController
  before_action :set_params, only: [:show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  private

  def items_params
    params.require(:item).permit(:image, :title, :introduction, :category_id, :status_id, :postage_id, :area_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end
end

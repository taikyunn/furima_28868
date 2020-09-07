class ItemsController < ApplicationController
  before_action :set_params, only: %i[show edit update purchase buy]

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

  def update
    if @item.update(items_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def purchase
    @place = UserPurchase.new
  end

  def buy
    @place = UserPurchase.new(purchase_params)
    @place.save
    binding.pry
    redirect_to root_path
  end

  private

  def items_params
    params.require(:item).permit(:image, :title, :introduction, :category_id, :status_id, :postage_id, :area_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def purchase_params
    params.permit(:prefecture_id, :postal_code, :city, :address, :building, :phone_number, :purchase_id, :user_id)
  end

end

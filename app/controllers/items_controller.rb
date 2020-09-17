class ItemsController < ApplicationController
  before_action :set_params, only: %i[ edit update purchase buy destroy]

  def index
    @items = Item.all.order('created_at DESC')
    # @favorite = Favorite.find(params[id])
    # @favorite_count = Favorite.where(id: @favorite.ids).count
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

  def edit
    render :show unless @item.user_id == current_user.id
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def update
    if @item.update(items_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def show
    @item = Item.find(params[:id])
    @messages = @item.messages.includes(:user)
    @message = Message.new

    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)
  end

  def purchase
    if @item.purchase.present?
      redirect_to root_path
    elsif user_signed_in?
      redirect_to root_path unless current_user.id != @item.user_id
    else
      redirect_to root_path
    end
    @place = UserPurchase.new
  end

  def buy
    @place = UserPurchase.new(card_params)
    if @place.valid?
      pay_item
      @place.save
      redirect_to root_path
    else
      render 'purchase'
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def items_params
    params.require(:item).permit(:image, :title, :introduction, :category_id, :status_id, :postage_id, :area_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == Item.user_id
  end

  def card_params
    params.permit(:prefecture_id, :postal_code, :city, :address, :building, :phone_number, :purchase_id, :user_id, :token, :price).merge(user_id: current_user.id, item_id: @item.id, purchase_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: card_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :find_shop, only: [:index, :new, :show, :create]
  
  def index
    # @item = Item.find(params[:id])
    @items = Item.all
  end
  
  def new
    @item = @shop.items.build
  end
  
  def show
  end
  
  def create
    @item = @shop.items.build(item_params)
    if @item.save
      redirect_to shop_items_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to shop_items_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @item.destroy
    redirect_to shop_items_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :category, :price, :discount, :soldout)
  end
  
  def find_item
    @item = Item.find(params[:id])
  end
  
  def find_shop
    @shop = Shop.find(params[:shop_id])
  end
  
end
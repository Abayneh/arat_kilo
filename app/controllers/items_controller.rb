class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:edit, :update, :destroy]
  before_action :find_shop, only: [:index, :new, :show, :create]
  
  def index
    @myitems = @shop.items.paginate(page: params[:page], :per_page => 2)
  end
  
  def new
    @categories = Category.all.map {|c| [c.name, c.id]}
    @item = @shop.items.new
  end
  
  def show
    @item = Item.find(params[:id]) #item id
    @category = Category.find(@item.category_id)
  end
  
  def create
    @item = @shop.items.new(item_params)
    @item.category_id = params[:category_id]

    if @item.save
      flash[:info] = "Item added Successfully"
      redirect_to shop_items_path
    else
      flash[:warning] = "Unable to add item, please try again"
      render 'new'
    end
  end
  
  def edit
    @categories = Category.all.map {|c| [c.name, c.id]} #???
  end
  
  def update
    @item.category_id = params[:category_id]
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
    params.require(:item).permit(:name, :price, :discount, :soldout, :category_id, :picture)
  end
  
  def find_item
    @item = Item.find(params[:id])
  end
  
  def find_shop
    @shop = Shop.find(params[:shop_id])
  end
  
end
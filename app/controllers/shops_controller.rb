class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_shop, only: [:edit, :update, :destroy]
  
  def index
    # list all shops
    @shops = Shop.all.order("created_at DESC")
  end
  
  def show
    @shops = Shop.all.order("created_at DESC")
  end
  
  def new
    @shop = current_user.shops.build #Amazing!
  end
  
  def create 
    @shop = current_user.shops.build(shop_params)
    
    if @shop.save 
      redirect_to root_path
    else 
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @shop.update(shop_params)
      redirect_to shop_path
    else
      render 'edit'
    end    
  end
  
  def destroy
    @shop.destroy
    redirect_to root_path
  end
  
  private 
    def shop_params
      params.require(:shop).permit(:name, :description, :address)
    end
          
    def find_shop
      @shop = Shop.find(params[:id])
    end
    
  
end
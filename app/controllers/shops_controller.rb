class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_shop, only: [:show, :edit, :update, :destroy]
  before_action :find_shops, only: [:index]

  # before_action :find_user, only: [:index]
  
  def index
  end
  
  def show
  end

  def new
    @shop = current_user.shops.build
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
    
    def find_shops
      @shops = Shop.all.order("created_at DESC")
    end

end
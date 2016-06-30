class StaticPagesController < ApplicationController
  
  def myshop
    @myshop = current_user.shops.all
    # @shops = Shop.all.order("created_at DESC")
  end
  
end

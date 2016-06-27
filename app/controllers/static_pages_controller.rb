class StaticPagesController < ApplicationController
  
  def myshop
    @shops = Shop.all.order("created_at DESC")
  end
  
end

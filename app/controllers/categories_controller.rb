class CategoriesController < ApplicationController
  before_filter :verify_is_admin
  before_action :find_category, only: [:edit, :update, :destroy]
  
  def index
    @categories = Category.all.order("name ASC")
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @category.update(category_params)
      render categories_path
    else
      render 'new'
    end
  end
  
  def destroy
    @category.destroy
    redirect_to categories_path
  end

  
  private 
    
  def category_params
    params.require(:category).permit(:name)
  end
  
  def find_category
    @category = Category.find(params[:id])
  end
  
  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
  
end
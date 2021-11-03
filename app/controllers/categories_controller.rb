class CategoriesController < ApplicationController 
  
  def show 
    @category = Category.find(params[:id]) 
  end

  def new 
    @category = Category.new
  end

  def index 
     @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def create 
    @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Category was successful created"
        redirect_to @category
      else
        render 'new'    
      end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
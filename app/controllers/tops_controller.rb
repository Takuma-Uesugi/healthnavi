class TopsController < ApplicationController
  def index
    @categories = Category.all
    
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
    else
      @category = Category.find(1)
    end
  end
  
  def show
    @content = Content.find(params[:id])
  end
end

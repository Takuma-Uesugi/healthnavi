class Advisers::ContentsController < ApplicationController
  before_action :authenticate_adviser!
  
  def new
    @content = Content.new
    @categories = Category.all
  end
  
  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to adviser_path(params[:adviser_id]), flash: {notice: 'TOPページにコンテンツを追加しました'}
    else
      redirect_to new_adviser_content_path, flash: {alert: 'コンテンツの登録に失敗しました'}
    end
  end
  
  def edit
    @content = Content.find(params[:id])
  end
  
  def update
    if @content.update(content_params)
      redirect_to adviser_path(params[:adviser_id]), flash: {notice: 'コンテンツを更新しました'}
    else
      redirect_to edit_adviser_content_path(current_adviser.id, @content.id), flash: {alert: 'コンテンツの更新に失敗しました'}
    end
  end
  
  def destroy
    
  end
  
  private
  
  def content_params
    params.require(:content).permit(:title, :image, :first_paragraph, :first_content, :second_paragraph, :second_content, :third_paragraph, :third_content).merge(adviser_id: current_adviser.id, category_ids: params[:category][:category_ids])
  end
end

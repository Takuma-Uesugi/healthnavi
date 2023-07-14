class Users::LifeLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:create, :update]
  
  def new
    @life_log = LifeLog.new
  end
  
  def create
    @life_log = LifeLog.new(set_params)
    if @life_log.save
      redirect_to user_path(current_user), flash: {notice: '生活ログを投稿しました'}
    else
      redirect_to new_user_life_log_path(current_user), flash: {alert: '生活ログを投稿できませんでした'}
    end
  end
  
  private
  
  def set_params
    params.require(:life_log).permit(:sleepiness, :feeling, :feces, :foods).merge(user_id: current_user.id)
  end
end

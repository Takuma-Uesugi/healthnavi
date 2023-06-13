class AdvisersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @adviser = Adviser.find(params[:id])
  end
end

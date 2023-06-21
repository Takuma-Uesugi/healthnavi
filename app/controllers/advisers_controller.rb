class AdvisersController < ApplicationController
  before_action :authenticate_adviser!
  
  def show
    @adviser = Adviser.find(params[:id])
  end
end

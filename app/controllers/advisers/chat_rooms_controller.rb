class Advisers::ChatRoomsController < ApplicationController
  before_action :authenticate_adviser!
  
  def index
    @adviser = Adviser.find(params[:adviser_id])
  end
end

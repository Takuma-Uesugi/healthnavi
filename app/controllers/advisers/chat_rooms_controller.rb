class Advisers::ChatRoomsController < ApplicationController
  def index
    @adviser = Adviser.find(params[:id])
  end
end

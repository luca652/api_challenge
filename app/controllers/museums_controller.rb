class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
    @request = Request.new
  end

  def create
    @museum = Museum.new(museum_params)
    if @museum.save
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end
end

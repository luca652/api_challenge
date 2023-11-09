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

  def mapbox_api_call
    require "json"
    require "open-uri"

    url = "https://api.mapbox.com/museums?lat=52.494857&lng=13.437641"
    museums_json = URI.open(url).read
    museums = JSON.parse(museums_json)
    p museums
  end
end

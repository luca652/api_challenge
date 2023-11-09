class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      mapbox_api_call(@request.latitude, @request.longitude)
    else
      render root_path, status: :unprocessable_entity
    end
  end


  private

  def request_params
    params.require(:request).permit(:address)
  end

  def mapbox_api_call(lat, long)
    require "json"
    require "open-uri"

    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=-#{lat},#{long}&access_token=pk.eyJ1IjoibHVjYS1nYXN0YWxkaSIsImEiOiJjbGZsaHN5d3QwMWcxNDNtbWRqencxMmNsIn0.XlVywjCjDzociHEu2-N48Q"
    museums_json = URI.open(url).read
    museums = JSON.parse(museums_json)
    p museums
  end
end

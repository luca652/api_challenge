class Api::V1::MuseumsController < ActionController::API

  def index
    long = params["long"]
    lat = params["lat"]
    @museums = mapbox_api_call(long, lat)
  end

  private

  def mapbox_api_call(long, lat)
    require "json"
    require "open-uri"

    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{long},#{lat}?&access_token=pk.eyJ1IjoibHVjYS1nYXN0YWxkaSIsImEiOiJjbGZsaHZjNnAwMjVoM3BsbGM3cHlwa3ZnIn0.8ct97Ctk1TYsYMhAI0fexg"

    museums = URI.open(url).read
    museums_hash = JSON.parse(museums)
    postcodes_and_names(museums_hash)
  end

  def postcodes_and_names(museums_hash)

    results = {}

    museums_hash["features"].each do |museum|
      # results["name"] = museum["text"]
      museum["context"].each do |context|
        if context["id"].include? "postcode"
          results[context["text"]] = museum["text"]
        end
      end
    end
    results
    end
end

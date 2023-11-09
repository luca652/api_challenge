json.museums do
  @museums.each do |postcode, name|
    json.set! postcode do
      json.name name
    end
  end
end

json.array!(@locations) do |location|
  json.extract! location, :id, :name, :address, :lat, :lng, :last_geocoded_at, :description, :status, :comments
  json.url location_url(location, format: :json)
end

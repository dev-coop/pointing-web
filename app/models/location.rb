class Location < ActiveRecord::Base

  default_scope { order('updated_at DESC') }

  validates_presence_of :name

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode # auto-fetch coordinates

  # The Google Geocode API does not return elevation, but Google does provide an Elevation API.  We'll make a second
  # call to get elevation after the first call geocodes the location.
  before_save :get_elevation
  before_save :geocode_timestamp

  private

  # Returns elevation (in meters)
  # API documentatoin https://developers.google.com/maps/documentation/geocoding/
  def get_elevation
    if self.lat && self.lng
      url = "https://maps.googleapis.com/maps/api/elevation/json?locations=#{self.lat},#{self.lng}"
      uri = URI.parse(url)
      response = Net::HTTP.get(uri)
      self.elevation = JSON.parse(response)['results'].first['elevation'].to_f
    end
  end

  def geocode_timestamp
    if self.lat && self.lng
      self.last_geocoded_at = Time.now
    end
  end


end

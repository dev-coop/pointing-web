class Location < ActiveRecord::Base

  validates_presence_of :name

  geocoded_by :address, :latitude  => :lat, :longitude => :lng
  after_validation :geocode          # auto-fetch coordinates

end

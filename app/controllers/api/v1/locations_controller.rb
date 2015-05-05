module Api
  module V1
    class LocationsController < Api::V1::ApiController
      respond_to :json

      def index
        respond_with  Location.where('last_geocoded_at IS NOT NULL')
                              .reorder("RANDOM()")
                              .limit(5)
                              .pluck(:id, :name, :address, :lat, :lng, :elevation)

      end
    end
  end

end
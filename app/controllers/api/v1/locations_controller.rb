module Api
  module V1
    class LocationsController < Api::V1::ApiController
      respond_to :json

      def index
        # locations = Location.where('last_geocoded_at IS NOT NULL')
        #   .reorder("RANDOM()")
        #   .limit(5)
        #   .pluck(:id, :name, :address, :lat, :lng, :elevation, :distance)

        me = Location.new(location_params)

        locations = Location.near(me)

        # locations.each { |l| l << l.distance(me) }

        respond_with locations
      end

      private

      # Never trust parameters from the scary internet, only allow the white list through.
      def location_params
        params.permit(:lat, :lng)
      end
    end
  end
end
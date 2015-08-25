module Api
  module V1
    class LocationsController < Api::V1::ApiController
      respond_to :json
      RESULT_TOTAL = 10
      def index
        me = Location.new(location_params)
        local_locations = Location.near(me, 25).reorder("RANDOM()").limit(5)
        any_locations = Location.where('last_geocoded_at IS NOT NULL').where('id NOT IN (?)', local_locations.ids).reorder("RANDOM()").limit(RESULT_TOTAL - local_locations.size)
        locations = local_locations + any_locations
        locations.shuffle!
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
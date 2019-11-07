class MapController < ApplicationController
    geocode_ip_address
    def geokit
        @location = session[:geo_location]  # @location is a GeoLoc instance.
        logger.debug "hello #{@location}"
    end
    def index
        @location = params[:location]
    end
    def location
        redirect_to map_index_url(request.parameters)
    end
end
  
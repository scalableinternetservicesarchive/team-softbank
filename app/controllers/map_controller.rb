class MapController < ApplicationController
    def index
        @location = params[:location]
        logger.debug "hello #{@location}"
    end
    def location
        redirect_to map_index_url(request.parameters)
    end
end
  
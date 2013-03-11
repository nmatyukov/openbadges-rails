module OpenBadges
  class ApplicationController < ActionController::Base

  	# GET /
    def show
      respond_to do |format|
        format.html # show.html.erb
      end
    end

  end
end

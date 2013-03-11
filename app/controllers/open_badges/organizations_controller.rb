require_dependency "open_badges/application_controller"

module OpenBadges
  class OrganizationsController < ApplicationController

    #before_filter :authenticate_user!

    # GET /organization
    def show
      @organization = Organization.first || Organization.new

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization }
      end
    end

    # POST /organization
    def create
      @organization = Organization.first || Organization.create

      respond_to do |format|
        if @organization.update_attributes(params[:organization])
          format.html { redirect_to :back, :flash => { :success => 'Organization was successfully updated.' } }
        else
          format.html { redirect_to :back, :flash => { :error => 'Organization was not successfully updated.' } }
        end
      end
    end
  end
end

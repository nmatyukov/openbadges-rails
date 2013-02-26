require_dependency "open_badges/application_controller"

module OpenBadges
  class OrganizationsController < ApplicationController

    # GET /organization
    def show
      @organization = Organization.first

      if @organization.nil?
        @organization = Organization.create
      end

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization }
      end
    end
  
    # POST /organization
    def update2
      @organization = Organization.first

      if @organization.nil?
        @organization = Organization.create
      end

      respond_to do |format|
        if @organization.update_attributes(params[:organization])
          format.html { redirect_to :back, notice: 'Organization was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end

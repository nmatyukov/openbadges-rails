require_dependency "open_badges/application_controller"

module OpenBadges
  class OrganizationsController < ApplicationController

    # GET /organization
    def show
      @organization = Organization.first

      if @organization.nil?
        @organization = Organization.new
      end

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @organization }
      end
    end
  
    # POST /organization
    def update2
      @organization = Organization.first

      #if @organization.nil?
      #  @organization = Organization.new(params[:organization])
      #end

  logger.debug(params[:organization])
      respond_to do |format|
        #if @organization.update_attributes(params[:organization])
        if @organization.update_attributes(params.except(:csrf, :action, :controller))
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

require_dependency "open_badges/application_controller"

require 'digest'
require 'securerandom'

module OpenBadges
  class AssertionsController < ApplicationController
    # GET /assertions
    def index
      @assertions = Assertion.all
  
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  
    # GET /assertions/1.json
    def show
      @assertion = Assertion.find(params[:id])
  
      respond_to do |format|
        format.json { render json: @assertion }
      end
    end
  
    # GET /assertions/new
    # GET /assertions/new.json
    def new
      @assertion = Assertion.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @assertion }
      end
    end
  
    # GET /assertions/1/edit
    def edit
      @assertion = Assertion.find(params[:id])
    end
  
    # POST /assertions
    def create
      @assertion = Assertion.new(params[:assertion])
      # IdentityObject
      #@assertion.identity = Digest::SHA256.hexdigest('#{@user.email}#{@assertion.identity_salt}')

      # bake
      #assertion.badge.image

      #image = ChunkyPNG::Image.from_blob(open(badge.image).read) # maybe can use from url
      #image = ChunkyPNG::Image.from_file(assertion.badge.image) # probably local files only
      #image.metadata['openbadges'] = assertions_url
      #image.to_blob # no save
      #image.save('file.png')
  
      respond_to do |format|
        if @assertion.save

          format.html { redirect_to assertions_url, :flash => { :success => 'Assertion was successfully created.' } }
        else
          format.html { render action: "new" }
        end
      end
    end
  
    # PUT /assertions/1
    def update
      @assertion = Assertion.find(params[:id])
  
      respond_to do |format|
        if @assertion.update_attributes(params[:assertion])
          format.html { redirect_to assertions_url, :flash => { :success => 'Assertion was successfully updated.' } }
        else
          format.html { render action: "edit" }
        end
      end
    end
  
    # DELETE /assertions/1
    def destroy
      @assertion = Assertion.find(params[:id])
      @assertion.destroy
  
      respond_to do |format|
        format.html { redirect_to assertions_url }
      end
    end
  end
end

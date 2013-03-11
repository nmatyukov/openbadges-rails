require_dependency "open_badges/application_controller"

module OpenBadges
  class BadgesController < ApplicationController

    #before_filter :authenticate_user!

    # GET /badges
    # GET /badges.json
    def index
      @badges = Badge.all
  
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  
    # GET /badges/1
    # GET /badges/1.json
    def show
      @badge = Badge.find(params[:id])
  
      respond_to do |format|
        format.json { render json: @badge }
      end
    end
  
    # GET /badges/new
    # GET /badges/new.json
    def new
      @badge = Badge.new
  
      respond_to do |format|
        format.html # new.html.erb
      end
    end
  
    # GET /badges/1/edit
    def edit
      @badge = Badge.find(params[:id])
    end
  
    # POST /badges
    # POST /badges.json
    def create
      @badge = Badge.new(params[:badge])
  
      respond_to do |format|
        if @badge.save
          format.html { redirect_to badges_url, :flash => { :success => 'Badge was successfully created.' } }
        else
          format.html { render action: "new" }
        end
      end
    end
  
    # PUT /badges/1
    # PUT /badges/1.json
    def update
      @badge = Badge.find(params[:id])
  
      respond_to do |format|
        if @badge.update_attributes(params[:badge])
          format.html { redirect_to badges_url, :flash => { :success => 'Badge was successfully updated.' } }
        else
          format.html { render action: "edit" }
        end
      end
    end
  
    # DELETE /badges/1
    # DELETE /badges/1.json
    def destroy
      @badge = Badge.find(params[:id])
      @badge.destroy
  
      respond_to do |format|
        format.html { redirect_to badges_url, :flash => { :success => 'Badge was successfully deleted.' } }
      end
    end
  end
end

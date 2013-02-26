require_dependency "open_badges/application_controller"

module OpenBadges
  class BadgeTagsController < ApplicationController
    # GET /badge_tags
    # GET /badge_tags.json
    def index
      @badge_tags = BadgeTag.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @badge_tags }
      end
    end
  
    # GET /badge_tags/1
    # GET /badge_tags/1.json
    def show
      @badge_tag = BadgeTag.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @badge_tag }
      end
    end
  
    # GET /badge_tags/new
    # GET /badge_tags/new.json
    def new
      @badge_tag = BadgeTag.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @badge_tag }
      end
    end
  
    # GET /badge_tags/1/edit
    def edit
      @badge_tag = BadgeTag.find(params[:id])
    end
  
    # POST /badge_tags
    # POST /badge_tags.json
    def create
      @badge_tag = BadgeTag.new(params[:badge_tag])
  
      respond_to do |format|
        if @badge_tag.save
          format.html { redirect_to @badge_tag, notice: 'Badge tag was successfully created.' }
          format.json { render json: @badge_tag, status: :created, location: @badge_tag }
        else
          format.html { render action: "new" }
          format.json { render json: @badge_tag.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /badge_tags/1
    # PUT /badge_tags/1.json
    def update
      @badge_tag = BadgeTag.find(params[:id])
  
      respond_to do |format|
        if @badge_tag.update_attributes(params[:badge_tag])
          format.html { redirect_to @badge_tag, notice: 'Badge tag was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @badge_tag.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /badge_tags/1
    # DELETE /badge_tags/1.json
    def destroy
      @badge_tag = BadgeTag.find(params[:id])
      @badge_tag.destroy
  
      respond_to do |format|
        format.html { redirect_to badge_tags_url }
        format.json { head :no_content }
      end
    end
  end
end

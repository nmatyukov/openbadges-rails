require_dependency "open_badges/application_controller"

module OpenBadges
  class BadgeAlignmentsController < ApplicationController
    # GET /badge_alignments
    # GET /badge_alignments.json
    def index
      @badge_alignments = BadgeAlignment.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @badge_alignments }
      end
    end
  
    # GET /badge_alignments/1
    # GET /badge_alignments/1.json
    def show
      @badge_alignment = BadgeAlignment.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @badge_alignment }
      end
    end
  
    # GET /badge_alignments/new
    # GET /badge_alignments/new.json
    def new
      @badge_alignment = BadgeAlignment.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @badge_alignment }
      end
    end
  
    # GET /badge_alignments/1/edit
    def edit
      @badge_alignment = BadgeAlignment.find(params[:id])
    end
  
    # POST /badge_alignments
    # POST /badge_alignments.json
    def create
      @badge_alignment = BadgeAlignment.new(params[:badge_alignment])
  
      respond_to do |format|
        if @badge_alignment.save
          format.html { redirect_to @badge_alignment, notice: 'Badge alignment was successfully created.' }
          format.json { render json: @badge_alignment, status: :created, location: @badge_alignment }
        else
          format.html { render action: "new" }
          format.json { render json: @badge_alignment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /badge_alignments/1
    # PUT /badge_alignments/1.json
    def update
      @badge_alignment = BadgeAlignment.find(params[:id])
  
      respond_to do |format|
        if @badge_alignment.update_attributes(params[:badge_alignment])
          format.html { redirect_to @badge_alignment, notice: 'Badge alignment was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @badge_alignment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /badge_alignments/1
    # DELETE /badge_alignments/1.json
    def destroy
      @badge_alignment = BadgeAlignment.find(params[:id])
      @badge_alignment.destroy
  
      respond_to do |format|
        format.html { redirect_to badge_alignments_url }
        format.json { head :no_content }
      end
    end
  end
end

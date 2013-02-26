require_dependency "open_badges/application_controller"

module OpenBadges
  class AlignmentsController < ApplicationController
    # GET /alignments
    # GET /alignments.json
    def index
      @alignments = Alignment.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @alignments }
      end
    end
  
    # GET /alignments/1
    # GET /alignments/1.json
    def show
      @alignment = Alignment.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @alignment }
      end
    end
  
    # GET /alignments/new
    # GET /alignments/new.json
    def new
      @alignment = Alignment.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @alignment }
      end
    end
  
    # GET /alignments/1/edit
    def edit
      @alignment = Alignment.find(params[:id])
    end
  
    # POST /alignments
    # POST /alignments.json
    def create
      @alignment = Alignment.new(params[:alignment])
  
      respond_to do |format|
        if @alignment.save
          format.html { redirect_to @alignment, notice: 'Alignment was successfully created.' }
          format.json { render json: @alignment, status: :created, location: @alignment }
        else
          format.html { render action: "new" }
          format.json { render json: @alignment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /alignments/1
    # PUT /alignments/1.json
    def update
      @alignment = Alignment.find(params[:id])
  
      respond_to do |format|
        if @alignment.update_attributes(params[:alignment])
          format.html { redirect_to @alignment, notice: 'Alignment was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @alignment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /alignments/1
    # DELETE /alignments/1.json
    def destroy
      @alignment = Alignment.find(params[:id])
      @alignment.destroy
  
      respond_to do |format|
        format.html { redirect_to alignments_url }
        format.json { head :no_content }
      end
    end
  end
end

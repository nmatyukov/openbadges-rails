require_dependency "open_badges/application_controller"

module OpenBadges
  class AlignmentsController < ApplicationController

    #before_filter :authenticate_user!

    # GET /alignments
    def index
      @alignments = Alignment.all
  
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  
    # GET /alignments/new
    # GET /alignments/new.json
    def new
      @alignment = Alignment.new
  
      respond_to do |format|
        format.html # new.html.erb
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
          format.html { redirect_to alignments_url, :flash => { :success => 'Alignment was successfully created.' } }
        else
          format.html { redirect_to :back, :flash => { :error => @alignment.errors.full_messages.first } }
        end
      end
    end
  
    # PUT /alignments/1
    # PUT /alignments/1.json
    def update
      @alignment = Alignment.find(params[:id])
  
      respond_to do |format|
        if @alignment.update_attributes(params[:alignment])
          format.html { redirect_to alignments_url, notice: 'Alignment was successfully updated.' }
        else
          format.html { render action: "edit" }
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
      end
    end
  end
end

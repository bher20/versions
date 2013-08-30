class ApplicationsController < ApplicationController
  load_and_authorize_resource :except => [:get_latest_version, :newer_version]

  # GET /applications
  # GET /applications.json
  def index
    @applications = Application.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @application }
    end
  end

  def get_latest_version
    @application = Application.find(params[:application_id])
    version = @application.versions.first!

    respond_to do |format|
      #if found
        format.html { redirect_to version }
        format.json { render json: version.to_render_hash }
      #else
       # format.json { render json: @application.errors, status: :unprocessable_entity }
      #end
    end
  end

  def newer_version
    @application = Application.find(params[:application_id])
    supplied_version = params[:version]

    newer = nil
    @application.versions.each do |v|
      if v.is_newer? supplied_version
        newer = v
      end
    end


    respond_to do |format|
      if newer != nil
        format.json { render json: version.to_render_hash }
      else
        format.json { render json: false }
      end
    end
  end

  # GET /applications/new
  # GET /applications/new.json
  def new
    @application = Application.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(params[:application])

    respond_to do |format|
      if @application.save
        format.html { redirect_to(@application, :notice => t('applications.create_success')) }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to(@application, :notice => t('applications.update_success')) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :no_content }
    end
  end
end

class VersionsController < ApplicationController
  before_filter :load_application, :except => [:destroy, :show, :index]
  #before_filter :authenticate_user!, :only => [:update, :destroy, :create, :new, :edit ]
  load_and_authorize_resource

  # GET /versions
  # GET /versions.json
  def index
    @versions = Version.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @versions }
    end
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
    @version = Version.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: version }
    end
  end

  def create
    @version = @application.versions.new(params[:version])
    if @version.save
      respond_to do |format|
        format.html { redirect_to @application, :notice => t('versions.create_success') }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @application, :alert => t('versions.create_failure') }
        format.js { render 'fail_create.js.erb' }
      end
    end
  end

  # GET /versions/1/edit
  def edit
    @version = Version.find(params[:id])
    @version.change_log = @version.change_log.join("\n")
  end

  # PUT /versions/1
  # PUT /versions/1.json
  def update
    @versions = Version.find(params[:id])

    respond_to do |format|
      if @versions.update_attributes(params[:versions])
        format.html { redirect_to(@versions, :notice => t('versions.update_success')) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @version = Version.find(params[:id])
    @version.destroy
    respond_to do |format|
      format.html { redirect_to @application.application_url, :notice => t('versions.destroy_success') }
      format.js
    end
  end

  private
  def load_application
    @application = Application.find(params[:application_id])
  end
end

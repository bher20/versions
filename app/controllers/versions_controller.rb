class VersionsController < ApplicationController
  before_filter :load_application, :except => [:destroy, :show, :index]
  before_filter :authenticate, :only => [:create, :destroy]

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
      format.html # show.html.erb
      format.json { render json: version }
    end
  end

  def create
    version_params = params[:version]
    version_params[:change_log] = version_params[:change_log].lines.map(&:chomp)
    version_params[:number] = Versionomy.parse(version_params[:number].chomp)


    @version = @application.versions.new(version_params)
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
    @application = Application.find_by_guid(params[:application_id])
  end
end

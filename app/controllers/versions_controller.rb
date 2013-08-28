class VersionsController < ApplicationController
  before_filter :load_application

  def create
    version_params = params[:version]
    version_params[:change_log] = version_params[:change_log].lines.map(&:chomp)


    @version = @application.versions.new(version_params)
    if @version.save
      redirect_to @application, :notice => 'Version added'
    else
      redirect_to @application, :alert => 'Unable to add version'
    end
  end

  def destroy
    @version = @application.versions.find(params[:id])
    @version.destroy
    redirect_to @application, :notice => 'Version deleted'
  end

  private
  def load_application
    @application = Application.find(params[:application_id])
  end
end

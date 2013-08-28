class VersionsController < ApplicationController
  before_filter :load_application

  def create
    version_params = params[:version]
    version_params[:change_log] = version_params[:change_log].lines.map(&:chomp)


    @comment = @application.versions.new(version_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @application, :notice => 'Thanks for your comment' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @application, :alert => 'Unable to add comment' }
        format.js { render 'fail_create.js.erb' }
      end
    end
  end

  def destroy
    @version = @application.versions.find(params[:id])
    @version.destroy
    respond_to do |format|
      format.html { redirect_to application, :notice => 'Version deleted' }
      format.js
    end
  end

  private
  def load_application
    @application = Application.find(params[:application_id])
  end
end

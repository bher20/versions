class ProfilesController < ApplicationController
  before_filter :load_user

  def create
    @profile = @user.profile.new(params[:profile])
    if @profile.save
      redirect_to @user, :notice => 'Thanks for your comment'
    else
      redirect_to @user, :alert => 'Unable to add comment'
    end
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: t('profiles.update_success') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = @user.profile
    @profile.destroy
    redirect_to @user, :notice => 'Comment deleted'
  end

  private
  def load_user
     @user = User.find(params[:user_id])
  end
end

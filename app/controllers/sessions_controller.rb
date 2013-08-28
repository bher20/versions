class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => t('sessions.login_successful')
    else
      flash.now[:alert] = t('sessions.invalid_login')
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => t('sessions.logout_successful')
  end
end

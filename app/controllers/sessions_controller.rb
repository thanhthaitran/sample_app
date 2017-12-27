class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      login user
    else
      flash.now[:danger] = t "error_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def login user
    if user.activated?
      log_in user
      params[:session][:remember_me] == Settings.params.value_1 ? remember(user) : forget(user)
      redirect_back_or user
    else
      message = t "message_activate"
      message += t "message_check"
      flash[:warning] = message
      redirect_to root_url
    end
  end
end

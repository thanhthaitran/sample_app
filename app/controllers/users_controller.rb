class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(show new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :find_user, only: :show

  def show
    @microposts = @user.microposts.created_at_desc.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "info_check"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "success_update"
      redirect_to @user
    else
      render :edit
    end
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    User.find_by(params[:id]).destroy
    flash[:success] = t "success_delete"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def find_user
    @user = User.find_by params[:id]
    return if @user
    flash[:danger] = t "error_sign_up"
    redirect_to root_path
  end
end

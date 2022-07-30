class UsersController < ApplicationController

  # =============CALLBACKS=====================
  before_action :find_user, only: [:edit, :update]
  before_action :authenticate_user!, except: [:new, :create]
  before_action :authorize_user!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: "Logged In!"
    else
      render new
    end
  end



  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to posts_path
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def authorize_user!
      redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @user)
  end

  def authenticate_user!
    redirect_to root_path, notice: "Please sign in" unless user_signed_in?
  end

  def find_user
    @user = User.find params[:id]
  end


end

class PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :authorize_user!

  def edit

  end

  def update
    current_password = params[:current_password]
    new_password = params[:new_password]
    # puts new_password
    password_confirmation = params[:password_confirmation]
    # puts password_confirmation
    @user = current_user


    if @user.authenticate(current_password)
      # puts 'sometext line20'
      if current_password != new_password && new_password == password_confirmation
        # puts 'sometext line 22'
        @user.update(
        password: new_password,
        password_confirmation: password_confirmation)
          if @user.valid?
          flash[:success] = "Password changed"
          redirect_to posts_path
        else
          flash[:alert] = @user.errors.full_messages.join(", ")
          redirect_to edit_user_password_path(@user), {notice: "wrong password"}
        end

      end
    end

  end


  private
  def authorize_user!
      redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @user)
  end

  def authenticate_user!
    redirect_to root_path, notice: "Please sign in" unless user_signed_in?
  end

  def find_user
    @user = User.find params[:user_id]
  end





















end

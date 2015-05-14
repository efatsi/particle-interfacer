class UsersController < ApplicationController
  before_action :assign_user, only: [:show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(:user, @user)
      flash[:notice] = "Welcome!"
      redirect_to root_url
    else
      flash.now[:alert] = "There was an issue with that"
      render :new
    end
  end

  def show
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      flash.now[:alert] = "There was an issue with that"
      render :show
    end
  end

  private

  def assign_user
    @user = current_user
  end

  def user_params
    params[:user].permit!
  end
end

class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def edit
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update!(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    User.find_by(current_user.id).destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :location, :interests)
  end

end

class UsersController < ApplicationController

  def index
    @users = User.all
    #render json: @users, method: :score, include: [:talents, :reputations]
  end

  def show
    @user = User.find_by(id: params[:id])
    # render json: @user, include: [:talents, :timeslots]
  end

  def edit
    @user = User.find_by(id: params[:id])
    render json: @user, include: :timeslots
  end

  def create
    @user = User.create!(user_params)
    if @user
      session[:user_id] = @user.id
      p "SENDING MAIL"
      UserMailer.notify_email(@user).deliver_now
      redirect_to root_path
    else
      [404, "user was not created"]
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update!(user_params)
    # render json: @user
    render :show
  end

  def destroy
    User.find_by(current_user.id).destroy
    redirect_to root_path
  end

  private
  def user_params
    params.permit(:username, :password, :password_confirmation, :email, :location, :interests, :about)
  end


end

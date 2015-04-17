class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user.try(:authenticate, (params[:password]))
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end

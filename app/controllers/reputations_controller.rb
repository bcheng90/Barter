class ReputationsController < ApplicationController

  def create
    p "params"
    p params
    judge = User.find_by(id: session[:user_id])
    user = User.find_by(id: params[:id])
    @reputation = Reputation.create!(user_id: user, judge_id: judge, params[:rating])
    render json: @reputation
  end

  # private
  # def reputation_params
  #   params.permit(:rating).merge(judge_id: current_user.id)
  # end

end

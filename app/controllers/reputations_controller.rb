class ReputationsController < ApplicationController

  def create
    p "params"
    p params
    judge = User.find_by(id: session[:user_id])
    @reputation = Reputation.create!(user_id: params[:user_id], judge_id: judge.id, rating: params[:rating])
    p "@reputation"
    p @reputation
    render json: @reputation
  end

  # private
  # def reputation_params
  #   params.permit(:rating).merge(judge_id: current_user.id)
  # end

end

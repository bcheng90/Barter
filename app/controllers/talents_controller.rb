class TalentsController < ApplicationController

  def index
    @talents = Talent.all
    render json: @talents, include: :user
  end

  def show
    @talent = Talent.find_by(id: params[:id])
    render json: @talent
  end

  def edit
    @talent = Talent.find_by(id: params[:id])
    render json: @talent
  end

  def create
    p "*"*80
    p talent_params
    p "*"*80
    @talent = Talent.create!(user: current_user, talent_params)
    render json: @talent
  end

  def for_user
    @talents = Talent.where(user_id: params[:user_id])
    render json: @talents
  end

  def update
    @talent = Talent.find_by(id: params[:id])
    @talent.update!(talent_params)
    render json: @talent
    # render :show
  end

  def destroy
    Talent.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private
  def talent_params
    params.permit(:title, :type, :sample, :experience, :description, :image)
  end

end

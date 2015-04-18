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
    @talent = talent.create!(talent_params)
    redirect_to talent_path(@talent.id)
  end

  def update
    @talent = Talent.find_by(id: params[:id])
    @talent.update!(talent_params)
    redirect_to talent_path(@talent.id)
  end

  def destroy
    Talent.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private
  def talent_params
    params.require(:talent).permit(:title, :type, :sample, :experience, :description).merge(user_id: current_user.id)
  end

end

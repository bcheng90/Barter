class TimeslotsController < ApplicationController

  def show
    @timeslot = Timeslot.find_by(id: params[:id])
    render json: @timeslot
  end

  def edit
    @timeslot = Timeslot.find_by(id: params[:id])
    render json: @timeslot
  end

  def create
    @timeslot = Timeslot.create!(timeslot_params)
    render json: @timeslot
  end

  def update
    @timeslot = Timeslot.find_by(id: params[:id])
    @timeslot.update!(timeslot_params)
    render json: @timeslot
  end

  def destroy
    @timeslot = Timeslot.find_by(id: params[:id])
    @timeslot.destroy
    render json: @timeslot
  end

  private
  def timeslot_params
    params.require(:timeslot).permit(:time, :offer_id).merge(user_id: current_user.id)
  end
end

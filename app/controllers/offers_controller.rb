class OffersController < ApplicationController

  def show
    @offer = Offer.find_by(id: params[:id])
    render json: @offer
  end

  def edit
    @offer = Offer.find_by(id: params[:id])
    render json: @offer
  end

  def create
    timeslot = Timeslot.find(params[:id])
    user = User.find_by(id: session[:user_id])
    @offer = Offer.create!(timeslot: timeslot, student_id: user.id)
    render json: @offer
  end

  def update
    @offer = Offer.find_by(id: params[:id])
    @offer.status = params[:status]
    @offer.save
    render json: @offer
  end

  def destroy
    @offer = Offer.find(params[:id])
    Offer.find_by(id: params[:id]).destroy
    render json: @offer
  end


end

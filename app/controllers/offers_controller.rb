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
    @offer = offer.create!(offer_params)
    render json: @offer
  end

  def update
    @offer = Offer.find_by(id: params[:id])
    @offer.update!(offer_params)
    render json: @offer
  end

  def destroy
    Offer.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private
  def offer_params
    params.require(:offer).merge(user_id: current_user.id)
  end
end

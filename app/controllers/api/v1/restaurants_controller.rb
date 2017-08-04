class Api::V1::RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all, adapter: :json
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: { restaurant: restaurant}, adapter: :json
  end
end

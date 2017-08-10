class Api::V1::RestaurantsController < ApplicationController
  def index
    render json: Restaurant.all, adapter: :json
  end

  def show
    restaurant = Restaurant.find(params[:id])
    pictures = Picture.where(restaurant_id: params[:id])
    render json: { restaurant: restaurant, pictures: pictures }, adapter: :json
  end
end

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
  @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = 'Restaurant was successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Restaurant was not created successfully'
      render :new
    end
  end
end

private

def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :address,
      :city,
      :state,
      :zip,
      :img_url
    )
end

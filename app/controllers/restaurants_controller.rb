class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    #temporary search capability til we switch to react filter
    if valid_search_params
      @restaurant = Restaurant.search(params[:search]).order("created_at DESC").first
      if @restaurant
        redirect_to restaurant_path(@restaurant)
      else
        flash[:notice] = "No results found for '#{params[:search]}'"
        @restaurants = Restaurant.all.order("created_at ASC")
        redirect_to root_path
      end
    end
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

def valid_search_params
    params[:search] &&
      params[:search] != "" &&
      params[:search] != " " &&
      params[:search].length > 1
end

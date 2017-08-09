class PicturesController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @picture = Picture.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @picture = Picture.new(picture_params)
    
    if @picture.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  private

  def picture_params
    params.require(:picture).permit(
    :img_url,
    :restaurant_id
    )
  end
end

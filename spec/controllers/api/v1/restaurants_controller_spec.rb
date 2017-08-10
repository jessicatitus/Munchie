require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do

  let!(:first_restaurant) do
    Restaurant.create!(
      name: "Union Square Donuts",
      address: "20 Bow Street",
      city: "Somerville",
      state: "MA",
      zip: "02143",
      img_url: File.open(Rails.root.join("spec/support/images/chio-day-quotes.jpg"))
 )
  end

  let!(:second_restaurant) do
    Restaurant.create!(
      name: "Something Sweet Without Wheat",
      address: "19 6th Road",
      city: "Woburn",
      state: "MA",
      zip: "01801",
      img_url: File.open(Rails.root.join("spec/support/images/chio-day-quotes.jpg"))
    )
  end

  let!(:first_picture) do
    Picture.create!(
    restaurant: first_restaurant,
    img_url: File.open(Rails.root.join("spec/support/images/chio-day-quotes.jpg"))
    )
  end

  let!(:second_picture) do
    Picture.create!(
    restaurant: first_restaurant,
    img_url: File.open(Rails.root.join("spec/support/images/chio-day-quotes.jpg"))
    )
  end

  let!(:first_user) do
    User.create(
      first_name: "Ann",
      last_name: "Perkins",
      email: "annperkins@pawnee.com",
      password: "123456",
      password_confirmation: "123456",
      profile_photo: "http://blog.elanco.org/floodm7a/files/2015/10/"\
      "Ann-Perkins-1lh7b3a.jpg"
    )
  end

  let!(:second_user) do
    User.create(
      first_name: "Ron",
      last_name: "Swanson",
      email: "ron@pawnee.com",
      password: "123456",
      password_confirmation: "123456",
      profile_photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:A"\
      "Nd9GcQFs-NXeCNuUaQ2RgAuy_0bptbQCKPCdyaga2eLiV7UVqAjQyGzzA"
    )
  end

  describe "GET#index" do
    it "should return a list of all the restaurants" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['restaurants'].length).to eq 2
      expect(returned_json['restaurants'][0]["name"]).to eq "Union Square Donuts"
      expect(returned_json['restaurants'][0]["img_url"]).to eq "/uploads/restaurant/img_url/9/chio-day-quotes.jpg"

      expect(returned_json['restaurants'][1]["name"]).to eq "Something Sweet"\
      " Without Wheat"
      expect(returned_json['restaurants'][1]["img_url"]).to eq {"url"=>"/uploads/restaurant/img_url/13/chio-day-quotes.jpg", "thumb"=>{"url"=>"/uploads/restaurant/img_url/13/thumb_chio-day-quotes.jpg"}}
    end
  end

  describe "GET#show" do
    it "should return a restaurant and all its pictures" do
      get :show, params: { id: first_restaurant.id,   headers: { "HTTP_API_TOKEN": "token"} }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json['restaurant']["name"]).to eq first_restaurant.name
      expect(returned_json['restaurants']["address"]).to eq first_restaurant.address
      expect(returned_json['restaurants']["city"]).to eq first_restaurant.city
      expect(returned_json['restaurants']["state"]).to eq first_restaurant.state
      expect(returned_json['restaurants']["zip"]).to eq first_restaurant.zip
      expect(returned_json['pictures'].length).to eq 2
    end
  end
end

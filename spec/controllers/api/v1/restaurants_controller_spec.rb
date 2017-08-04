require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do

  let!(:first_restaurant) do
    Restaurant.create(
      name: "Union Square Donuts",
      address: "20 Bow Street",
      city: "Somerville",
      state: "MA",
      zip: "02143",
      description: "Cult donut-maker offers unique sweet and savory flavors,"\
      " pastries, and java in modern wood-clad digs",
      img_url: "http://static1.squarespace.com/static/51dacd5be4b0a4195e57886a"\
      "/t/54622df0e4b0719cb5b6638a/1415720432271/USDlogo.png?format=1000w"
    )
  end

  let!(:second_restaurant) do
    Restaurant.create(
      name: "Something Sweet Without Wheat",
      address: "19 6th Road",
      city: "Woburn",
      state: "MA",
      zip: "01801",
      description: "Snug colorful bakeshop lures locals with its range of"\
      " homemade, gluten-free, and vegan desserts",
      img_url: "http://3.bp.blogspot.com/-sV8nvQ4Gdp4/TjrLSxQDz3I/AAAAAAAAAA4"\
      "/CGBF679SyTU/s860/new%2Bblog%2Bpic.jpg"
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

      expect(returned_json['restaurant'].length).to eq 2
      expect(returned_json['restaurant'][0]["name"]).to eq "Union Square Donuts"
      expect(returned_json['restaurant'][0]["address"]).to eq "20 Bow Street"
      expect(returned_json['restaurant'][0]["city"]).to eq "Somerville"
      expect(returned_json['restaurant'][0]["state"]).to eq "MA"
      expect(returned_json['restaurant'][0]["zip"]).to eq "02143"
      expect(returned_json['restaurant'][0]["description"]).to eq "Cult"\
      " donut-maker offers unique sweet and savory flavors, pastries,"\
      " and java in modern wood-clad digs"
      expect(returned_json['restaurant'][0]["img_url"]).to eq "http://static1."\
      "squarespace.com/static/51dacd5be4b0a4195e57886a/t/54622df0e4b0719cb5b"\
      "6638a/1415720432271/USDlogo.png?format=1000w"

      expect(returned_json['restaurant'][1]["name"]).to eq "Something Sweet"\
      " Without Wheat"
      expect(returned_json['restaurant'][1]["address"]).to eq "19 6th Road"
      expect(returned_json['restaurant'][1]["city"]).to eq "Woburn"
      expect(returned_json['restaurant'][1]["state"]).to eq "MA"
      expect(returned_json['restaurant'][1]["zip"]).to eq "01801"
      expect(returned_json['restaurant'][1]["description"]).to eq "Snug"\
      " colorful bakeshop lures locals with its range of homemade, "\
      "gluten-free, and vegan desserts"
      expect(returned_json['restaurant'][1]["img_url"]).to eq "http://3."\
      "bp.blogspot.com/-sV8nvQ4Gdp4/TjrLSxQDz3I/AAAAAAAAAA4/CGBF679SyTU"\
      "/s860/new%2Bblog%2Bpic.jpg"

    end
  end

  describe "GET#show" do
    it "should return a restaurant and all its pictures" do
      get :show, params: { id: first_restaurant.id }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json['restaurant']["name"]).to eq first_restaurant.name
      expect(returned_json['pictures'].length).to eq 2
    end
  end
end

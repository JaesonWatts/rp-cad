class VehiclesController < ApplicationController

  # GET: /vehicles
  get "/vehicles" do
    erb :"/vehicles/index.html"
  end

  # GET: /vehicles/new
  get "/vehicles/new" do
    erb :"/vehicles/new.html"
  end

  # POST: /vehicles
  post "/vehicles" do
    binding.pry
    @vehicle = Vehicle.create(params[:vehicle])
    @vehicle.save
    redirect "/vehicles"
  end

  # GET: /vehicles/5
  get "/vehicles/:id" do
    erb :"/vehicles/show.html"
  end

  # GET: /vehicles/5/edit
  get "/vehicles/:id/edit" do
   
    @vehicle = Vehicle.find_by_id(params[:id])
    erb :"/vehicles/edit.html"
  end

  # PATCH: /vehicles/5
  patch "/vehicles/:id" do
    @vehicle = Vehicle.find_by_id(params[:id])
    @vehicle.update(params[:vehicle])
    @vehicle.save
    redirect "/vehicles/#{@vehicle[:id]}"
  end

  # DELETE: /vehicles/5/delete
  delete "/vehicles/:id" do
    @vehicle = Vehicle.find_by_id(params[:id])
    @vehicle.delete
    redirect "/vehicles"
  end
end

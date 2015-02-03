class PlanetsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @planets = Planet.all
  end

  def new
  end

  def create
    Planet.create planet_params
    redirect_to(planets_path)
  end

  def show
    @planet = Planet.find params[:id]
  end

  def edit
    @planet = Planet.find params[:id]
  end

  def update
    planet = Planet.find params[:id]
    planet.update planet_params
    redirect_to(planet_path(planet.id))
  end

  def destroy
    planet = Planet.find params[:id]
    planet.destroy
    redirect_to(planets_path)
  end

  private
  def planet_params
    # Whitelisting the allowed parameters
    params.require(:planet).permit(:name, :image, :orbit, :mass, :diameter, :distance, :moons)
  end
end

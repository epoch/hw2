class OceansController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @oceans = Ocean.all
  end

  def new
  end

  def create
    @ocean = Ocean.create ocean_params
    redirect_to(ocean_path(@ocean.id))
  end

  def show
    @ocean = Ocean.find params[:id]
  end

  def edit
    @ocean = Ocean.find params[:id]
  end

  def update
    ocean = Ocean.find params[:id]
    ocean.update ocean_params
    redirect_to(ocean_path(ocean.id))
  end

  def destroy
    ocean = Ocean.find params[:id]
    ocean.destroy
    redirect_to('/oceans')
  end

  private
  def ocean_params
    # Whitelisting the permitted parameters
    # this stops people from throwing any old thing into your db
    # being specific so it can't be messed around with
    params.require(:ocean).permit(:name, :image, :max_depth, :earth_percentage, :countries)
  end
end

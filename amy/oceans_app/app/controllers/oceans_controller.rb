class OceansController < ApplicationController
    skip_before_filter :verify_authenticity_token

    #home page
    def index
    @oceans = Ocean.all
    end

    #form for new ocean
    def new
    end

    #actual creation of the ocean 
    def create
        Ocean.create(ocean_params)
        redirect_to(oceans_path)
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
        ocean  = Ocean.find params[:id]
        ocean.destroy
        redirect_to(oceans_path)
    end

    private

    def ocean_params
        params.require(:ocean).permit(:name, :deepest_point, :area, :image, :average_depth)
    end


end

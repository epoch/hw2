class MountainsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    # homepage
    def index
        @mountains = Mountain.all
    end

    #new form
    def new
    end

    #actual creation
    def create
        Mountain.create(mountain_params)
        redirect_to(mountains_path)
    end

    # show single mountiain by id
    def show
        @mountain = Mountain.find params[:id]
    end


    #edit form 
    def edit
        @mountain = Mountain.find params[:id]
    end

    # actual update save to db
    def update
        mountain = Mountain.find params[:id]
        mountain.update(mountain_params)
        redirect_to(mountain_path(mountain.id))
    end

    #delete
    def destroy
        mountain = Mountain.find params[:id]
        mountain.destroy
        redirect_to(mountains_path)
    end

    private

    def mountain_params
        params.require(:mountain).permit(:name, :height, :country, :image, :nearest_ocean)
    end

end

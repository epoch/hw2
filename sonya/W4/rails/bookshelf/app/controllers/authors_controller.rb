class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @author = Author.find params[:id]
  end

  def update
  end

  def destroy
  end
end

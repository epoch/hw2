class PagesController < ApplicationController
  
  def home
  end

  def index
    @users = User.all
  end

end
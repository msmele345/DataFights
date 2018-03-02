class WatchlistsController < ApplicationController


  def new
  end

  def create
    p "******"
    p params
    redirect_to root_path
  end

  def destroy
  end



end
class StocksController < ApplicationController

  def new
    @stock = Stock.new
  end

  def index
  end

  def create
    # p"***********"
    # p params["stock"]
    # @user_picks = user_list(params["stock"])
    # p @user_picks

    redirect_to root_path
  end

  def show
    @stock = Stock.find_by(:symbol => params[:id])
    p "*******"
    p params
    p @stock
  end

  def destroy
  end


end
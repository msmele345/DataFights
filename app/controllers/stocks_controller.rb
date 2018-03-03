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

    if Stock.find_by(:symbol => params[:id])
      @stock = Stock.find_by(:symbol => params[:id])
      render :show
    else
      add_single_stock(params[:id])
      redirect_to stock_path(params[:id])
    end
  end

  def destroy
  end


end
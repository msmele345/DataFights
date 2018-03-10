class StocksController < ApplicationController

  def new
    @stock = Stock.new
  end

  def index
  end

  def create
  end


  ##TODO
  ##Compare previous close with current close and convert to % to show gain
  ##Design historical quotes display

  ##Ice Box

  ##Adjust method to allow user to enter how many days back he/she wants
  ##Click Events using jquery




  def show
    if Stock.find_by(:symbol => params[:id])
      @stock = Stock.find_by(:symbol => params[:id])
      @quotes = single_stock_quote(@stock.symbol)
      enter_historical_data(@quotes, @stock.id)
      render :show
    else
      add_single_stock(params[:id])
      @stock = Stock.find_by(:symbol => params[:id])
      @quotes = single_stock_quote(@stock.symbol)
      enter_historical_data(@quotes, @stock.id)
      redirect_to stock_path(params[:id])
    end
  end

  def destroy
  end


end
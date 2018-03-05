class StocksController < ApplicationController

  def new
    @stock = Stock.new
  end

  def index
  end

  def create
  end


  ##TODO - do I need all of them in the else route?
  ##Extract loop into controller or seperate method
  ##Figure out validations!!!!! START HERE
  ##clean up modules and extract loop?
  ##Design historical quotes display
  ##before save method for date save?



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
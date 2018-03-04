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



  def show
    if Stock.find_by(:symbol => params[:id])
      @stock = Stock.find_by(:symbol => params[:id])
      @quotes = single_stock_quote(@stock.symbol)
      enter_historical_data(@quotes)
      @db_quotes = HistoricalQuote.first(5)
      @db_quotes.each {|quote| quote.update_attributes(:stock_id => @stock.id)}
      render :show
    else
      add_single_stock(params[:id])
      @stock = Stock.find_by(:symbol => params[:id])
      @quotes = single_stock_quote(@stock.symbol)
      @db_quotes = HistoricalQuote.first(5)
      redirect_to stock_path(params[:id])
    end
  end

  def destroy
  end


end
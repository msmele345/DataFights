class WatchlistsController < ApplicationController


  def new
  end

  def create
    @stock = Stock.new(:symbol => params["symbol"])
    if @stock.save
      @watchlist = Watchlist.create(:user_id => current_user.id, :stock_id => @stock.id)
    else
      @existing_stock = Stock.find_by(:symbol => params['symbol'])
      @watchlist = Watchlist.create(:user_id => current_user.id, :stock_id => @existing_stock.id)
    end
    redirect_to user_path(current_user)
  end

  def destroy
  end



end
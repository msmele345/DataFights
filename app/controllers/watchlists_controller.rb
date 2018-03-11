class WatchlistsController < ApplicationController


  def new
  end

  def create
    @stock = Stock.new(:symbol => params["symbol"])
    if @stock.save
      @watchlist = Watchlist.create(:user_id => current_user.id, :stock_id => @stock.id)
      fresh_data = fresh_quote(@stock.symbol)
      @stock.update_attributes(:last => fresh_data[:last], :volume => fresh_data[:volume])
    else
      @existing_stock = Stock.find_by(:symbol => params['symbol'])
      @watchlist = Watchlist.create(:user_id => current_user.id, :stock_id => @existing_stock.id)
      fresh_data = fresh_quote(@existing_stock.symbol)
      @existing_stock.update_attributes(:last => fresh_data[:last], :volume => fresh_data[:volume])

    end
    redirect_to user_path(current_user)
  end

  def destroy
    @watchlist = Watchlist.find(params[:id])
    @watchlist.destroy
    redirect_to user_path(current_user.id)
  end



end
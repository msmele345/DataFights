class GamesController < ApplicationController

  before_action :redirect_unless_logged_in

  def new
    @game = Game.new
  end

  def create
    @admin_selections = daily_quote.map {|stock| stock["1. symbol"] }.join(",")
    @result = []
     params["stock"].each do |watchlist_id|
        @result << Watchlist.find_by(:id => watchlist_id)
      end
     @user_selections =  @result.map {|watchlist| watchlist.stock.symbol }.join(",")

    @game = Game.create(:user_id => current_user.id, :user_selections => @user_selections, :admin_selections => @admin_selections)
    render :show
  end

  def destroy
  end

end

##TODO
##Call daily quote (refactor to take symbols). Display user picks and admin picks side by side.
##fix the damn button to start the game



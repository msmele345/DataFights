class GamesController < ApplicationController

  before_action :redirect_unless_logged_in

  def new
    @game = Game.new
  end

  def create
    @admin_selections = daily_quote
    p "**********"
    p params
    # @user_selections = user_list(params["stock"])
    # @game = Game.create(:user_id => current_user.id, :user_selections => @user_selections, :admin_selections => @admin_selections)
    render :show
  end

  def destroy
  end

end

##TODO
##fix the damn button to start the game
##iterate over watchlsit ids and find the stock symbols.
##Add each symbol into a string
##pass returned string into user_picks helper. Pass these results into new Game object
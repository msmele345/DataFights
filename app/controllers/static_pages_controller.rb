class StaticPagesController < ApplicationController

  def home
    @quotes = daily_quote
    @user_picks = user_list(params["stock"])
  end



  def help
  end

  def about
  end

  def contact

  end

end

##GAME
##player_name
##user_selections
##admin_selections
##outcome
##is_over? boolean



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


##Make stocks unique!
##Logic needed to prevent bad data
##Move personal stock lists to stocks pages



## When to run add stocks?


class StaticPagesController < ApplicationController

  def home
    # add_stocks
    @quotes = daily_quote
  end

  def help
  end

  def about
  end

  def contact

  end

  def quotes
  end
end


##Make stocks unique!
##Logic needed to prevent bad data
##Make stock add dynamic (From api call)
## When to run add stocks?
## Add watchlists

class StaticPagesController < ApplicationController

  def home
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


##Turn Quotes into active record objects
## iterate over in view
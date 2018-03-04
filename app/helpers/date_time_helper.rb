require 'date'

module DateTimeHelper

  def set_time(time)
    time.strftime("%l:%M %P")
  end

  def set_date(date)
    date.strftime("%m/%d/%y")
  end

  def pretty_date(date)
    real_time = Date.parse(date).to_date
    real_time.strftime("%B %dth")
  end

end
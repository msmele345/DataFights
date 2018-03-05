require 'net/http'


module ApiHelper

  def daily_quote
    base_url = "https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols=V,BAC,QCOM&apikey=5LXSJFF4UJMR1YVR"

    resp = Net::HTTP.get_response(URI.parse(base_url))

    buffer = resp.body
    result = JSON.parse(buffer)
    quotes = result["Stock Quotes"]
  end

  def add_stocks(list)
    list.each do |quote|
      Stock.create(:symbol => quote["1. symbol"],
                   :last => quote["2. price"],
                   :volume => quote["3. volume"])
    end
  end

  def single_stock_quote(symbol)
    base_url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{symbol}&apikey=5LXSJFF4UJMR1YVR"
    resp = Net::HTTP.get_response(URI.parse(base_url))
    buffer = resp.body
    result = JSON.parse(buffer)
    dates = result["Time Series (Daily)"]
  end

  def enter_historical_data(dates, stock_id)
    dates.each do |date, info|
      new_date = HistoricalQuote.create!(:date => date, :stock_id => stock_id)
        info.each do |data|
          if data[0].slice(3,(data[0].length-1)) == "open"
            new_date.update_attributes(:open => data[1] )
          elsif data[0].slice(3,(data[0].length-1)) == "high"
            new_date.update_attributes(:high => data[1] )
          elsif data[0].slice(3,(data[0].length-1))  == "low"
            new_date.update_attributes(:low => data[1] )
          elsif data[0].slice(3,(data[0].length-1)) == "close"
            new_date.update_attributes(:close => data[1] )
          elsif data[0].slice(3,(data[0].length-1)) =="volume"
            new_date.update_attributes(:volume => data[1] )
        end
      end
    end
  end




  def add_single_stock(string_symbol)
      Stock.create(:symbol => string_symbol)
  end

  def user_list(symbols)
    base_url = "https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols=#{symbols}&apikey=5LXSJFF4UJMR1YVR"

    resp = Net::HTTP.get_response(URI.parse(base_url))

    buffer = resp.body
    result = JSON.parse(buffer)
    quotes = result["Stock Quotes"]
  end


end
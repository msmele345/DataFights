require 'net/http'


module ApiHelper

  def daily_quote
    base_url = "https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols=V,ORCL,QCOM&apikey=5LXSJFF4UJMR1YVR"

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

  def user_list(symbols)
    base_url = "https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols=#{symbols}&apikey=5LXSJFF4UJMR1YVR"

    resp = Net::HTTP.get_response(URI.parse(base_url))

    buffer = resp.body
    result = JSON.parse(buffer)
    quotes = result["Stock Quotes"]
  end


end
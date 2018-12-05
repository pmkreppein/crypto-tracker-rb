

class Networking
#Gets prices on Startup
    def initialize
          get_prices()
    end
#Get Prices Function
    def get_prices()
      url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,GBP,EUR'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @prices = response

    end

    def refresh_prices()
      get_prices()
    end
#Returns Most Recent price Report
    def last_report()
      @prices
    end

end

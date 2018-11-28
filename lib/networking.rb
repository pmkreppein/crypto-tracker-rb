require 'net/http'

class Networking
    def initialize
          get_prices()
    end

    def get_prices()
      url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,GBP,EUR'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @prices = response

    end

    def refresh_prices()
      get_prices()
    end

    def last_report()
      return @prices
    end

end

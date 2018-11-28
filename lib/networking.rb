require 'net/http'
require 'json'
require 'ostruct'



class Networking
  attr_accessor :prices
    def initialize
          @prices = "1"
          puts "Network Established and prices loaded"
          puts "FROM INIT #{@prices}"
          get_prices()
          puts "FROM INIT #{@prices}"
    end

    def get_prices()
      url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,GBP,EUR'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @prices = response

    end

    def refresh_prices()
      get_prices()
      @prices
    end

    def last_report()
      return @prices
    end



end

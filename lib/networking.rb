require 'net/http'
require 'json'



class Networking
attr_reader :prices
    def initialize
          get_prices()
    end

    def get_prices()
      url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,JPY,EUR'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @prices = JSON.parse(response)
      puts "#{@prices}"
      @prices
    end

    def self.update_prices()
      url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,JPY,EUR'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      @prices = JSON.parse(response)
      puts "UPDATED:#{@prices}"
      @prices
    end

end

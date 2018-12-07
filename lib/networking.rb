class Networking

  #Get Prices Function
    def self.call_api()
      url = 'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,LTC&tsyms=USD,GBP,EUR'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response, object_class: OpenStruct)

    end
    
    def self.get_prices()
      prices = call_api()
      Coin.new(prices.BTC).name = "Bitcoin"
      Coin.new(prices.ETH).name = "Ethereum"
      Coin.new(prices.LTC).name = "Litecoin"
    end

    def self.refresh_prices()
      prices = call_api()
      Coin.all.find{|c| c.name == "Bitcoin"}.update(prices.BTC)
      Coin.all.find{|c| c.name == "Litecoin"}.update(prices.LTC)
      Coin.all.find{|c| c.name == "Ethereum"}.update(prices.ETH)
    end

end

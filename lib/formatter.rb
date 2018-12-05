require 'json'
require 'ostruct'
class Formatter
  
#Parse JSON as OpenStruct
def parse(prices)
  @parsed = JSON.parse(prices, object_class: OpenStruct)
end

#Simple Layout Format
def simple(input_prices)
  parse(input_prices)
  puts <<-HEREDOC
    Top Cryptos in USD:
    -- Bitcoin: #{@parsed.BTC.USD}
    -- Ethereum: #{@parsed.ETH.USD}
    -- Litecoin: #{@parsed.LTC.USD}
  HEREDOC
end

#Advanced Format Layout
def advanced(input_prices)
  parse(input_prices)

  puts <<-HEREDOC
    Detailed Price Report
      _________________
          Bitcoin
            ** USD: #{@parsed.BTC.USD}
            ** GBP: #{@parsed.BTC.GBP}
            ** EUR: #{@parsed.BTC.EUR}
      _________________
          Litecoin
            ** USD: #{@parsed.LTC.USD}
            ** GBP: #{@parsed.LTC.GBP}
            ** EUR: #{@parsed.LTC.EUR}
      _________________
          Ethereum:
            ** USD: #{@parsed.ETH.USD}
            ** GBP: #{@parsed.ETH.GBP}
            ** EUR: #{@parsed.ETH.EUR}
HEREDOC
  end


end

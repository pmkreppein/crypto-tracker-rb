require 'json'
class Formatter
    def initialize()
        puts "Formatter Booted"
        @parsed = ""

    end



def parse(prices)
  @parsed = JSON.parse(prices, object_class: OpenStruct)
end

def simple(input_prices)
  parse(input_prices)
  puts <<-HEREDOC
    Value of Below in USD:
    -- Bitcoin: #{@parsed.BTC.USD}
    -- Ethereum: #{@parsed.ETH.USD}
    -- Litecoin: #{@parsed.LTC.USD}
  HEREDOC
end

def advanced(input_prices)
  parse(input_prices)

  puts <<-HEREDOC
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
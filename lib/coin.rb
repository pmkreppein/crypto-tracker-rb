class Coin
    @coins = []
    attr_reader :name, :usd, :gbp, :eur, :raw_data
  
    def initialize(data)
      update(data)
    end

    def update(data)
      @usd = data.USD
      @gbp = data.GBP
      @eur = data.EUR
      @raw_data = data
    end
  end  
class Coin
    @@all = []
    attr_accessor :name, :USD, :GBP, :EUR 
    def initialize(data)
      update(data)
      @@all << self
    end

    def update(data)
      @USD = data.USD
      @GBP = data.GBP
      @EUR = data.EUR

    end

    def self.all
      @@all
    end
  end  
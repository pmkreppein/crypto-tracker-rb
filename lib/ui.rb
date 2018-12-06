

class UI
  #Spin up Networking and Formatter Classes
  def initialize()
    @networking = Networking.new
    data = @networking.prices
    create_coins(data)
  end
  
  #Loop for startup screen 
  def startup()
    system "clear"
    puts "Welcome to Crypto Tracker!  Bear with us while we set things up!"
    sleep(1)
    puts "Done!"
    sleep(1)
    system "clear"
    run()
  end

#UI Menu Block
  def ui_loop()
    Constants.ascii()
    Constants.main_menu()
  end

#Refresh Prices Loop  
def run_refresh()
    @networking.refresh_prices
    data = @networking.prices
    update_coins(data)
end

#Create Coin Instances
def create_coins(data)
    @bitcoin = Coin.new(data.BTC)
    @ethereum = Coin.new(data.ETH)
    @litecoin = Coin.new(data.LTC)
end

#Update Coin prices
def update_coins(data)
    @bitcoin.update(data.BTC)
    @ethereum.update(data.ETH)
    @litecoin.update(data.LTC)
end



#Core App Loop
def run()
  while true
    system "clear"
    ui_loop()
    input = gets.chomp
#Evaluate Choices
    case input
      when "Q" , "q"
        system "clear"
        puts "Thanks for using Crypto Tracker!  Please wait for program to close."
        sleep(1)
        system "clear"
        abort("Crypto Tracker closed successfully")
#Simple Price Layout
      when "S", "s"
        system "clear"
        Constants.ascii()
        puts <<-HEREDOC
                Top Cryptos in USD:
                -- Bitcoin: #{@bitcoin.usd}
                -- Ethereum: #{@ethereum.usd}
                -- Litecoin: #{@litecoin.usd}
            HEREDOC
        puts "Push any key to return to Main Menu."
        input = gets.chomp
        sleep(1) until input
#Detailed Price Layout
      when "D", "d"
        system "clear"
        Constants.ascii()
        Constants.detailed_report(@bitcoin.raw_data, @litecoin.raw_data, @ethereum.raw_data)
        puts "Push any key to return to Main Menu."
        input = gets.chomp
        sleep(1) until input
#Refresh Prices
      when "r", "R"
        system "clear"
        Constants.ascii()
        puts "Refreshing prices..."
        self.run_refresh()
        puts "Prices Refreshed Successfully!"
        sleep(1)
#Unknown Input
      else
        system "clear"
        puts "¯\\_(ツ)_/¯"
        puts "Sorry, that wasn't a choice I recognize.  Try again?"
        sleep(3)
        self.run()
        end ##Else End  
    end ##Case End
  end ##Run() End

end ##Class end

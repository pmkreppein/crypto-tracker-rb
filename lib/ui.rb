

class UI
  #Spin up Networking and Formatter Classes
  def initialize()
    Networking.get_prices()
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


def detailed_report()
  puts "Detailed Price Report"
  puts " "
  Coin.all.each do |coin|
    puts"  _________________"
    puts"    #{coin.name}"
    puts"      ** USD: #{coin.USD}"
    puts"      ** EUR: #{coin.EUR}"
    puts"      ** GBP: #{coin.GBP}"
  end
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
        puts "Top Cryptos in USD:"
        Coin.all.each do |coin|
          puts "-- #{coin.name}:  #{coin.USD}"
        end

        puts "Push any key to return to Main Menu."
        input = gets.chomp
        sleep(1) until input
#Detailed Price Layout
      when "D", "d"
        system "clear"
        Constants.ascii()
        detailed_report()
        puts "Push any key to return to Main Menu."
        input = gets.chomp
        sleep(1) until input
#Refresh Prices
      when "r", "R"
        system "clear"
        Constants.ascii()
        puts "Refreshing prices..."
        Networking.refresh_prices()
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

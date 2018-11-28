require_relative 'networking.rb'
require_relative 'formatter.rb'

class UI

    def initialize()
      @networking = Networking.new
      @formatter = Formatter.new
    end

    def ascii()
      puts <<-HEREDOC
      .o88b. d8888b. db    db d8888b. d888888b  .d88b.       d888888b d8888b.  .d8b.   .o88b. db   dD d88888b d8888b.
     d8P  Y8 88  `8D `8b  d8' 88  `8D `~~88~~' .8P  Y8.      `~~88~~' 88  `8D d8' `8b d8P  Y8 88 ,8P' 88'     88  `8D
     8P      88oobY'  `8bd8'  88oodD'    88    88    88         88    88oobY' 88ooo88 8P      88,8P   88ooooo 88oobY'
     8b      88`8b      88    88~~~      88    88    88         88    88`8b   88~~~88 8b      88`8b   88~~~~~ 88`8b
     Y8b  d8 88 `88.    88    88         88    `8b  d8'         88    88 `88. 88   88 Y8b  d8 88 `88. 88.     88 `88.
      `Y88P' 88   YD    YP    88         YP     `Y88P'          YP    88   YD YP   YP  `Y88P' YP   YD Y88888P 88   YD
      HEREDOC
    end
    def ui_loop()

        puts "#{ascii}"
        puts <<-HEREDOC
        ______________________________________________________________________________
            Welcome to the Crypto Tracker CLI App.
            Please Select from the below menu:
            [S]imple View: Bitcoin, Ethereum, and Litecoin prices in USD.
            [D]etailed View: Bitcoin, Ethereum, and Litcoin prices in USD, GBP, EUR.
            [R]efresh: Refresh the current price data.
            [Q]uit: Exit the app
            Please type a selection and press 'Return' or 'Enter'....
        HEREDOC
    end



    def run()
        while true
            system "clear"
            ui_loop()
            input = gets.chomp

            case input
              when "Q" , "q"
                system "clear"
                puts "Thanks for using Crypto Tracker!  Please wait for program to close."
                sleep(1)
                system "clear"
                abort("Crypto Tracker closed successfully")

              when "S", "s"
                system "clear"
                puts "#{ascii}"
                puts "#{@formatter.simple(@networking.last_report)}"
                puts "Push any key to return to Main Menu."
                input = gets.chomp
                sleep(1) until input

              when "D", "d"
                system "clear"
                puts "#{ascii}"
                puts "#{@formatter.advanced(@networking.last_report)}"
                puts "Push any key to return to Main Menu."
                input = gets.chomp
                sleep(1) until input

              when "r", "R"
                system "clear"
                puts "#{ascii}"
                puts "Refreshing prices..."
                @networking.refresh_prices
                puts "Prices Refreshed Successfully!"
                sleep(1)

              else
                system "clear"
                puts "Sorry, that wasn't a choice I recognize.  Try again?"
                sleep(2)
                self.run()
            end


          end



end





end

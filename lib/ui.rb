require_relative 'networking.rb'
require_relative 'formatter.rb'

class UI

    def initialize()
      @networking = Networking.new
      @formatter = Formatter.new
    end


    def ui_loop()

        puts <<-HEREDOC
        ______________________________________________________________________________
            Welcome to the Crypto Tracker CLI App.
            Please Select from the below menu:
            [S]imple View: Bitcoin, Ethereum, and Litecoin prices in USD.
            [D]etailed View: Bitcoin, Ethereum, and Litcoin prices in USD, GBP, EUR.
            [Q]uit: Exit the app
            Please make a selection....
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
                puts "#{@formatter.simple(@networking.last_report)}"
                puts "Push any key to return to Main Menu."
                input = gets.chomp
                sleep(1) until input

              when "D", "d"
                system "clear"
                puts "#{@formatter.advanced(@networking.last_report)}"
                puts "Push any key to return to Main Menu."
                input = gets.chomp
                sleep(1) until input

              when "r", "R"
                system "clear"
                puts "Refreshing prices..."
                sleep(1)
                @networking.refresh_prices
                puts "Prices Refreshed Successfully!"

              else
                puts "Sorry, that wasn't a choice I recognize.  Try again?"
                sleep(2)
                self.run()
            end
          end



end





end

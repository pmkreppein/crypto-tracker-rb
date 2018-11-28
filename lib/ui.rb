require_relative 'crypto-tracker.rb'
require_relative 'networking.rb'
class UI
  attr_reader :switch_on

    def initialize()
        @switch_on = true
        run()

    end



    def run()
        while switch_on
            ui_loop()
            input = gets.chomp

            case input
              when "Q" , "q"
                    puts "Thanks for using Crypto Tracker!  Please wait for program to close."
                    sleep(2)
                    system "clear"
                    abort("Program closed successfully")

              when "S", "s", "D", "d"
                
                Networking.update_prices()
                puts "Push any key to return to Main Menu."
                input = gets.chomp
                sleep(1) until input


              else
                    puts "Sorry, that wasn't a choice I recognize.  Try again?"
                    sleep(2)
                    self.run()
            end
          end


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



end

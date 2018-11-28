require_relative 'ui.rb'

class CryptoTracker
#App Boot
    def initialize()
        system "clear"
        puts "Welcome to Crypto Tracker!  Bear with us while we set things up!"
        @ui = UI.new
        puts "Done!"
        sleep(1)
        system "clear"
        @ui.run()
    end
end

require_relative 'ui.rb'

class CryptoTracker

    def initialize()
        system "clear"
        puts "Welcome to Crypto Tracker!  Bear with us while we set things up!"
        @ui = UI.new
        sleep(1)
        puts "Done!"
        sleep(1)
        system "clear"
        @ui.run()
    end
end

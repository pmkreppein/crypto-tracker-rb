require_relative 'ui.rb'

class CryptoTracker

    def initialize()
        @ui = UI.new
        @ui.run()
    end
end

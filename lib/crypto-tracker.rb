require_relative 'formatter.rb'
require_relative 'networking.rb'
require_relative 'ui.rb'


class CryptoTracker


    def initialize()
        boot()
        UI.run
    end

    def boot()
        Networking.new
        Formatter.new
        UI.new
    end



end

CryptoTracker.new

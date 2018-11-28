require_relative 'ui.rb'


class CryptoTracker
attr_accessor :networking, :format, :ui

    def initialize()
        @ui = UI.new
        @ui.run()
    end
end

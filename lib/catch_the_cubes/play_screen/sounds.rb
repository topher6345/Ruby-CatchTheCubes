class CatchTheCubes
  class PlayScreen
    # == Sounds
    #
    # The sounds of PlayScreen
    #
    class Sounds
      include Gosu
      def initialize(width:)
        @width = width.to_f
        @catch = Sample.new("media/catch.aif")
        @miss = Sample.new("media/miss.aif")
      end

      def catch(x:)
        @catch.play_pan xpos_to_pan(x: x)
      end

      def miss(x:)
        @miss.play_pan xpos_to_pan(x: x)
      end

      private

      def xpos_to_pan(x:)
        (((x / @width) * 2.0) - 1.0)
      end
    end
  end
end

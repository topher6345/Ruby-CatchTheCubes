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
        @drop = Sample.new("media/drop.aif")
      end

      def catch(x_pos:)
        @catch.play_pan xpos_to_pan(x_pos: x_pos)
        @catch.play
      end

      def miss(x_pos:)
        @miss.play_pan xpos_to_pan(x_pos: x_pos)
        @miss.play
      end

      def drop(x_pos:)
        @drop.play_pan xpos_to_pan(x_pos: x_pos)
        @drop.play
      end

      private

      def xpos_to_pan(x_pos:)
        (((x_pos / @width) * 2.0) - 1.0)
      end
    end
  end
end

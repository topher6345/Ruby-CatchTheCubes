class CatchTheCubes
  class PlayScreen
    # == ScoreView
    #
    # Score info
    #
    class ScoreView
      attr_accessor :score, :count, :level
      def initialize
        @font = Gosu::Font.new(30)
        @score = 0
        @count = 0
        @level = 1
      end

      def draw
        @font.draw("Score: #{@score}", 0, 0, 1, 2.0, 2.0, Colors::WHITE)
        @font.draw("Cubes: #{@count}", 0, 40, 1, 2.0, 2.0, Colors::WHITE)
        @font.draw("Level: #{@level}", 0, 80, 1, 2.0, 2.0, Colors::WHITE)
        @font.draw(moving_average, 0, 120, 1, 2.0, 2.0, Colors::WHITE)
      end

      private

      def moving_average
        average = ((@score / @count.to_f) * 100.0)
        "Moving Average: #{average.round(2)}"
      end
    end
  end
end

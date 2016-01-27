class CatchTheCubes
  class PlayScreen
    # == ScoreView
    #
    # Score info
    #
    class ScoreView
      def initialize
        @font = Gosu::Font.new(30)
      end

      def update(score:, count:, level:)
        @score = score
        @count = count
        @level = level
      end

      def draw
        @font.draw("Score: #{@score}", 0, 0, 1, 2.0, 2.0, Colors::WHITE)
        @font.draw("Cubes: #{@count}", 0, 40, 1, 2.0, 2.0, Colors::WHITE)
        @font.draw("Level: #{@level}", 0, 80, 1, 2.0, 2.0, Colors::WHITE)
        @font.draw(moving_average, 0, 120, 1, 2.0, 2.0, Colors::WHITE)
      end

      def moving_average
        average = ((@score / @count.to_f) * 100.0)
        "Moving Average: #{average.round(2)}"
      end
    end
  end
end

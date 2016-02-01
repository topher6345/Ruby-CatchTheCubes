class CatchTheCubes
  class PlayScreen
    # == ScoreView
    #
    # Score info
    #
    class Score
      attr_accessor :score, :count, :level
      def initialize
        @font = Gosu::Font.new(30)
        @score = 0
        @count = 0
        @level = 1
      end

      def draw
        @font.draw("Score: #{@score}", 0, 0, 1, 1.7, 1.7, COLORS.first)
        @font.draw("Cubes: #{@count}", 0, 40, 1, 1.7, 1.7, COLORS.first)
        @font.draw("Level: #{@level}", 0, 80, 1, 1.7, 1.7, COLORS.first)
        @font.draw(moving_average, 0, 120, 1, 1.7, 1.7, COLORS.first)
      end

      private

      def moving_average
        average = ((@score / @count.to_f) * 100.0)
        "Moving Average: #{average.round(2)}"
      end
    end
  end
end

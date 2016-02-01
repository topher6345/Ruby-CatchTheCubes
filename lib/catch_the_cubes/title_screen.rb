class CatchTheCubes
  # == TitleScreen
  #
  # Splash
  #
  class TitleScreen
    require_relative "title_screen/update_interval"
    require_relative "title_screen/colors"

    def initialize
      @font = Gosu::Font.new(20)
      @update_interval = UpdateInterval.new(frames: 10)
      @color1 = COLORS.first
      @color2 = COLORS.last
      @cycle = COLORS.cycle
    end

    def update
      @update_interval.each do
        @color1 = @cycle.next
        @color2 = @cycle.next
      end
    end

    def draw
      x = Bounds::WIDTH / 3.0
      y = Bounds::HEIGHT / 2.0
      @font.draw("Catch The Cubes", x, y, 1, 1.0, 1.0, @color1)
      @font.draw("Click To Start", x, y + 20, 1, 1.0, 1.0, @color2)
    end
  end
end

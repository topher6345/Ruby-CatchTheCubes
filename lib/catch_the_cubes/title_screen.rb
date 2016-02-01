class CatchTheCubes
  # == TitleScreen
  #
  # Splash
  #
  class TitleScreen
    require_relative "title_screen/update_interval"
    X_CENTER = Bounds::WIDTH / 3.0
    Y_CENTER = Bounds::HEIGHT / 2.0

    def initialize
      @font = Gosu::Font.new(20)
      @update_interval = UpdateInterval.new(frames: 10)
      @cycle = COLORS.cycle
      @colors = [@cycle.next, @cycle.next]
    end

    def update
      @update_interval.each_interval do
        @colors[0] = @cycle.next
        @colors[1] = @cycle.next
      end
    end

    def draw
      draw_font(text: "Catch The Cubes")
      draw_font(text: "Click To Start", y_offset: 20)
    end

    def draw_font(text:, y_offset:0)
      @font.draw(
        text, X_CENTER, Y_CENTER + y_offset, 1, 1.0, 1.0, @colors.first)
    end
  end
end

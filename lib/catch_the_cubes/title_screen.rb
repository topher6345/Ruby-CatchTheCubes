class CatchTheCubes
  # == TitleScreen
  #
  # Splash
  #
  class TitleScreen
    def initialize
      @font = Gosu::Font.new(20)
    end

    def update
      # no-op
    end

    def draw
      x = Bounds::WIDTH / 3.0
      y = Bounds::HEIGHT / 2.0
      @font.draw("Catch The Cubes", x, y, 1, 1.0, 1.0, Colors::WHITE)
      @font.draw("Click To Start", x, y + 20, 1, 1.0, 1.0, Colors::WHITE)
    end
  end
end

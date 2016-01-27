class CatchTheCubes
  # == PlayScreen
  #
  #  Main gameplay
  #
  class PlayScreen
    require_relative "play_screen/cube"
    require_relative "play_screen/score_view"

    def initialize
      @cubes = []
      @score_view = ScoreView.new
      @score = 0
      @level = 1
      @cubes_count = 0
    end

    def update
      @cubes.each(&:update)
      @cubes.delete_if(&:bottom?)
      add_cube && (@level += 1) if @cubes.empty?
      @score_view.update(score: @score, count: @cubes_count, level: @level)
    end

    def draw
      @score_view.draw
      @cubes.each(&:draw)
    end

    def click(mouse_x, mouse_y)
      @cubes.delete_if do |cube|
        if cube.collision?(mouse_x, mouse_y)
          @score += 1
          true
        end
      end
    end

    def add_cube
      @level.times do
        # Start at a random y position
        # Except on the first level
        # (That way a cube drops immediately)
        start_y = if @level == 1
                    0
                  else
                    rand(Bounds::HEIGHT / 2.0) * -1
                  end

        start_x = rand(Bounds::WIDTH)

        # Add cube to set
        @cubes << Cube.new(start_x: start_x, start_y: start_y)

        # Keep tally of total cubes
        @cubes_count += 1
      end
    end
  end
end

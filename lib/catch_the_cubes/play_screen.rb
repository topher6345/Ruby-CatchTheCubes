class CatchTheCubes
  # == PlayScreen
  #
  #  Main gameplay
  #
  class PlayScreen
    require_relative "play_screen/cube"
    require_relative "play_screen/score_view"
    require_relative "play_screen/cubes"

    def initialize
      @cubes = Cubes.new
      @score = ScoreView.new
      @catch_sound = Gosu::Sample.new("media/catch.aif")
      @miss_sound = Gosu::Sample.new("media/miss.aif")
    end

    def update
      @cubes.each(&:update)

      @cubes.each_bottom do
        @miss_sound.play
      end

      @cubes.on_empty do
        add_cubes
        @score.level += 1
      end
    end

    def draw
      @score.draw
      @cubes.each(&:draw)
    end

    def click(mouse_x, mouse_y)
      @cubes.delete_if do |cube|
        if cube.collision?(mouse_x, mouse_y)
          @score.score += 1
          @catch_sound.play
          true
        end
      end
    end

    def add_cubes
      @score.level.times do
        # Add cube to set
        @cubes << Cube.new(start_x: start_x, start_y: start_y)

        # Keep tally of total cubes
        @score.count += 1
      end
    end

    private

    def start_y
      # Start at a random y position
      # Except on the first level
      # (That way a cube drops immediately)
      if @level == 1
        0
      else
        rand(Bounds::HEIGHT / 2.0) * -1
      end
    end

    def start_x
      rand(Bounds::WIDTH)
    end
  end
end

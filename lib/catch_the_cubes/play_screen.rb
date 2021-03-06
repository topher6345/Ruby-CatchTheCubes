class CatchTheCubes
  # == PlayScreen
  #
  #  Main gameplay
  #
  class PlayScreen
    require_relative "play_screen/cube"
    require_relative "play_screen/score"
    require_relative "play_screen/cubes"
    require_relative "play_screen/sounds"
    require_relative "play_screen/background"

    def initialize
      @cubes = Cubes.new
      @score = Score.new
      @background = Background.new(size: 0.5)
      @sounds = Sounds.new(width: Bounds::WIDTH)
      @click_up = true
    end

    def update
      @background.update
      @cubes.each(&:update)

      @cubes.each_bottom do |cube|
        @sounds.miss(x_pos: cube.x_pos)
      end

      @cubes.on_empty do
        add_cubes
        @score.level += 1
      end
    end

    def draw
      @background.draw
      @score.draw
      @cubes.each(&:draw)
    end

    def click(mouse_x, mouse_y)
      @cubes.delete_if do |cube|
        if cube.collision?(mouse_x, mouse_y) && @click_up
          @score.score += 1
          @sounds.catch(x_pos: cube.x_pos)
          @click_up = false
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
      @sounds.drop(x_pos: start_x)
    end

    def click_reset
      @click_up = true
    end

    private

    def start_y
      # Start at a random y position
      # Except on the first level
      # (That way a cube drops immediately)
      if @level == 1
        0
      else
        rand(Bounds::HEIGHT / 1.5) * -1
      end
    end

    def start_x
      rand(Bounds::WIDTH)
    end
  end
end

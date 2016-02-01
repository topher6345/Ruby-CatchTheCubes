class CatchTheCubes
  class PlayScreen
    # == Cube
    #
    #  The star of the show
    #
    class Cube
      COLLISION_RADIUS = 10
      attr_reader :x_pos

      def initialize(start_x:, start_y:, velocity:5)
        @cube = Gosu::Image.new("media/cube.png")
        @x_pos = start_x
        @y_pos = start_y
        @rotation_angle = 0
        @rotate_interval = rand(1..6) * [-1, 1].sample
        @velocity = velocity
      end

      def update
        @y_pos += @velocity
        @rotation_angle = (@rotation_angle + @rotate_interval) % 360
      end

      def bottom?
        @y_pos > Bounds::HEIGHT
      end

      def collision?(x_pos, y_pos)
        x_pos < (@x_pos + COLLISION_RADIUS) &&
          x_pos > (@x_pos - COLLISION_RADIUS) &&
          y_pos < (@y_pos + COLLISION_RADIUS) &&
          y_pos > (@y_pos - COLLISION_RADIUS)
      end

      def draw(size = 1)
        @cube.draw_rot(@x_pos, @y_pos, 1, @rotation_angle, 0.5, 0.5, size, size)
      end
    end
  end
end

class CatchTheCubes
  class PlayScreen
    # == Cube
    #
    #  The star of the show
    #
    class Cube
      COLLISION_RADIUS = 10
      attr_reader :x

      def initialize(start_x:, start_y:, velocity:5)
        @cube = Gosu::Image.new("media/cube.png")
        @x = start_x
        @y = start_y
        @rot = 0
        @rotate_interval = rand(1..6) * [-1, 1].sample
        @velocity = velocity
      end

      def update
        @y += @velocity
        @rot = (@rot + @rotate_interval) % 360
      end

      def bottom?
        @y > Bounds::HEIGHT
      end

      def collision?(x, y)
        x < (@x + COLLISION_RADIUS) && x > (@x - COLLISION_RADIUS) &&
          y < (@y + COLLISION_RADIUS) && y > (@y - COLLISION_RADIUS)
      end

      def draw(size = 1)
        @cube.draw_rot(@x, @y, 1, @rot, 0.5, 0.5, size, size)
      end
    end
  end
end

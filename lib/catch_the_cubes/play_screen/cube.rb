class CatchTheCubes
  class PlayScreen
    # == Cube
    #
    #  The star of the show
    #
    class Cube
      COLLISION_RADIUS = 10
      attr_reader :x

      def initialize(start_x:, start_y:)
        @cube = Gosu::Image.new("media/cube.png")
        @x = start_x
        @y = start_y
        @rot = 0
        @rotate_interval = rand(1..6) * [-1, 1].sample
      end

      def update
        @y += 5
        @rot = (@rot + @rotate_interval) % 360
      end

      def bottom?
        @y > Bounds::HEIGHT
      end

      def collision?(x, y)
        x < (@x + COLLISION_RADIUS) && x > (@x - COLLISION_RADIUS) &&
          y < (@y + COLLISION_RADIUS) && y > (@y - COLLISION_RADIUS)
      end

      def draw
        @cube.draw_rot(@x, @y, 1, @rot)
      end
    end
  end
end

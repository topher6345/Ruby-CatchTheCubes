class CatchTheCubes
  class PlayScreen
    # Cubes in the background
    class Background
      def initialize(size: 1)
        @size = size
        @array = Array.new(50) { new_cube(start_y: rand(Bounds::HEIGHT)) }
        @cubes = Cubes.new(@array)
      end

      def update
        @cubes.each(&:update)
        @cubes.each_bottom { @cubes << new_cube(start_y: 0) }
      end

      def draw
        @cubes.each { |cube| cube.draw(@size) }
      end

      def new_cube(start_y:0)
        Cube.new(
          start_x: rand(Bounds::WIDTH),
          velocity: rand(5..7),
          start_y: start_y
        )
      end
    end
  end
end

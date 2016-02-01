require "forwardable"
class CatchTheCubes
  class PlayScreen
    # == Cubes
    #
    #  A collection of cubes
    #
    class Cubes
      extend Forwardable
      def_delegators :@cubes, *([].methods - Object.new.methods)

      def initialize
        @cubes = []
      end

      def each_bottom
        each_with_index do |cube, index|
          if cube.bottom?
            yield(cube) if block_given?
            delete_at(index)
          end
        end
      end

      def on_collision(mouse_x, mouse_y)
        delete_if do |cube|
          if cube.collision?(mouse_x, mouse_y)
            yield if block_given?
            true
          end
        end
      end

      def on_empty
        yield if block_given? && @cubes.empty?
      end
    end
  end
end

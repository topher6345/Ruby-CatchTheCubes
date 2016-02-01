class CatchTheCubes
  # == TitleScreen
  #
  # Splash
  #
  class TitleScreen
    # Calls a block every n times its called
    class UpdateInterval
      def initialize(frames:)
        @frames = frames
        @count = 0
      end

      def each_interval
        @count = (@count + 1) % @frames
        yield if @count == 0
      end
    end
  end
end

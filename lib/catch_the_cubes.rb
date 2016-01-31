require "gosu"
require "./colors"

# == Catch The Cubes
#
class CatchTheCubes < Gosu::Window
  # Global Bounds for the screen
  module Bounds
    HEIGHT = 980
    WIDTH  = (HEIGHT * 1.75).to_i
  end
  require_relative "catch_the_cubes/title_screen"
  require_relative "catch_the_cubes/play_screen"

  def initialize
    super(Bounds::WIDTH, Bounds::HEIGHT)
    self.caption = "Catch The Cubes"

    # Our dictionary of scenes
    @scenes = Hash.new do |arg|
      fail "Screen #{arg} is not in the scenes hash"
    end

    @scenes[:title] = TitleScreen.new
    @scenes[:play]  = PlayScreen.new

    @current_screen = @scenes[:title]
    @song = Gosu::Song.new("media/celestine.mp3")
  end

  def update
    @song.play(true) unless @song.playing?
    case @current_screen

    when TitleScreen
      start_game if button_down?(Gosu::MsLeft)
    when PlayScreen
      @current_screen.click(mouse_x, mouse_y) if button_down?(Gosu::MsLeft)
    end

    @current_screen.update
  end

  def draw
    @current_screen.draw
  end

  def needs_cursor?
    true
  end

  def start_game
    @current_screen = @scenes[:play]
    @scenes[:play].add_cube
  end
end

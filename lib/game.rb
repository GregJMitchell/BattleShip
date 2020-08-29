require './lib/cell'
require './lib/ship'
require './lib/board'

class Game

attr_reader :player_grid, :computer_grid
  def initialize
    @player_grid = []
    @computer_grid =[]
  end

  def setup
    puts "I have laid out my ships on the grid."
    puts "You need to lay out your two ships."
    puts "The cruiser is 3 units long and the submarine is two units long."
    board = Board.new
    print board.render
  end

end

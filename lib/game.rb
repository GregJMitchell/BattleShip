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
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    print board.render
    puts "Enter squares for cruiser (3 spaces):"
    print ">"
    input = gets.chomp
    input = input.upcase
    input = input.split(" ")
    board.place(cruiser, input)
    print board.render(true)
    puts "Enter squares for submarine (2 spaces):"
    print ">"
    input = gets.chomp
    input = input.upcase
    input = input.split(" ")
    board.place(submarine, input)
    print board.render(true)

  end

end

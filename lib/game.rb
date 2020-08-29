require './lib/cell'
require './lib/ship'
require './lib/board'

class Game
  attr_reader :player_grid, :computer_grid, :player_board, :computer_board
  def initialize
    @player_grid = []
    @computer_grid =[]
    @player_board = player_board
    @computer_board = computer_board
  end

  def setup_ship(ship, board)
    input = gets.chomp
    input = input.upcase
    input = input.split(" ")
    if @player_board.valid_placement?(ship, input) == true
      @player_board.place(ship, input)
      print @player_board.render(true)
    else
      puts "Those are invalid coordinates. Please try again:"
      print ">"
      setup_ship(ship, @player_board)
    end
  end

  def random_placment(ship)
    random_cells = @computer_board.cells.keys.sample(ship.length)
    while @computer_board.valid_placement?(ship, random_cells) == false
      random_cells = @computer_board.cells.keys.sample(ship.length)
    end
    @computer_board.place(ship, random_cells)
  end

  def computer_placement
    @computer_board = Board.new
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    random_placment(cruiser)
    random_placment(submarine)

  end

  def setup
    puts "I have laid out my ships on the grid."
    puts "You need to lay out your two ships."
    puts "The cruiser is 3 units long and the submarine is two units long."
    @player_board = Board.new
    cruiser = Ship.new("cruiser", 3)
    submarine = Ship.new("submarine", 2)
    print @player_board.render
    puts "Enter squares for cruiser (3 spaces):"
    print ">"
    setup_ship(cruiser, @player_board)
    puts "Enter squares for submarine (2 spaces):"
    print ">"
    setup_ship(submarine, @player_board)
  end

  def render_turn
    puts "=============COMPUTER BOARD============="
    @computer_board.render
    puts "==============PLAYER BOARD=============="
    @player_board.render(true)
    puts "Enter the coordinate for your shot:"
    puts ">"
    player_shot
  end

  def player_shot
    input = gets.chomp
    input = input.upcase
    if @computer_board.valid_coordinate?(input) == false
      puts "Please enter a valid coordinate."
      player_shot
    elsif @computer_board["#{input}"].ship == true && @computer_board["#{input}"].ship.health == 1
      puts "Your shot on #{input} has sunk their {#{@computer_board["#{input}"].ship.name}}"
    elsif @computer_board["#{input}"].ship == true
      @computer_board["#{input}"].fire_upon
      puts "Your shot on #{input} was a hit!"
    else
      puts "Your shot on #{input} was a miss."

    end
  end
end

require './lib/cell'
require './lib/ship'
require './lib/board'

class Game
  attr_reader :player_shots, :computer_shots, :player_board, :computer_board
  def initialize
    @player_shots = []
    @computer_shots = []
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
    print @player_board.render(true)
    puts "Enter squares for cruiser (3 spaces):"
    print ">"
    setup_ship(cruiser, @player_board)
    puts "Enter squares for submarine (2 spaces):"
    print ">"
    setup_ship(submarine, @player_board)
    computer_placement
  end

  def render_turn
    puts "=============COMPUTER BOARD============="
    print @computer_board.render
    puts "==============PLAYER BOARD=============="
    print @player_board.render(true)
    puts "Enter the coordinate for your shot:"
    print ">"
    player_shot
    computer_shot
  end

  def player_shot
    input = gets.chomp
    input = input.upcase
    if @computer_board.valid_coordinate?(input) == false
      puts "Please enter a valid coordinate."
      player_shot
    elsif @player_shots.include?(input)
      puts "You have already shot at #{input}"
      player_shot
    elsif @computer_board.cells[input].ship == true && @computer_board.cells[input].ship.health == 1
      puts "Your shot on #{input} has sunk their {#{@computer_board.cells[input].ship.name}}"
      @player_shots << input
    elsif @computer_board.cells[input].ship == true
      @computer_board.cells[input].fire_upon
      puts "Your shot on #{input} was a hit!"
      @@player_shots << input
    else
      puts "Your shot on #{input} was a miss."
      @player_shots << input

    end
  end

  def computer_shot
    shot = @player_board.cells.keys.sample
    if @computer_shots.include?(shot)
      computer_shot
    else
      if @player_board.cells[shot].ship == true && @player_board.cells[shot].ship.health == 1
        puts "My shot on #{shot} has sunk your {#{@player_board.cells[shot].ship.name}}"
        @computer_shots << shot
      elsif @player_board.cells[shot].ship == true
        @player_board.cells[shot].fire_upon
        puts "My shot on #{shot} was a hit!"
        @computer_shots << shot
      else
        puts "My shot on #{shot} was a miss."
        @computer_shots << shot
      end
    end
  end
  
  def is_player_winner?
    @player_board.cells.all? do |cell|
      cell[-1].ship == nil
    end
  end

  def determine_winner
    if is_player_winner? == true
      "I won!"
    elsif is_computer_winner? == true
      'You won!'
    else
      false
    end
  end

  def is_computer_winner?
    @computer_board.cells.all? do |cell|
      cell[-1].ship == nil
    end
  end

  def start
    setup
    while determine_winner == false
      render_turn
    end
  end
end

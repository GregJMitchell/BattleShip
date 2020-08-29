require './lib/board'
require './lib/ship'
require './lib/cell'

class Turn
  attr_reader :player_board, :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end

  def render_turn
    puts "=============COMPUTER BOARD============="
    computer_board.render
    puts "==============PLAYER BOARD=============="
    player_board.render(true)
  end


end

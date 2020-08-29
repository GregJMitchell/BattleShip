require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
    @used_cells = []
  end

  def valid_coordinate?(coord)
    @cells.keys.include?(coord)
  end

  def is_overlapping?(placement)
    placement.each do |cell|
      @used_cells << cell
    end
  end

  def valid_placement?(ship, placement)
    return false if ship.length != placement.length
    number_array = []
    letter_array = []
    placement.each do |cell|
      return false unless valid_coordinate?(cell)

      return false if @used_cells.include?(cell)

      letter_array << cell[0]
      number_array << cell[1]
    end
    return true if letter_array.uniq.length == 1 && number_array == (number_array[0]..number_array[-1]).to_a
    return true if number_array.uniq.length == 1 && letter_array == (letter_array[0]..letter_array[-1]).to_a

    false
  end

  def place(ship, placement)
      placement.each do |cell|
        @cells[cell].place_ship(ship)
      end
      is_overlapping?(placement)
  end

  def render(player = false)
    number_array = %w[1 2 3 4]
    letter_array = %w[A B C D]
    grid = []

    if player == true
      letter_array.each do |letter|
        number_array.each do |number|

          grid << @cells["#{letter}#{number}"].render(true)
        end
      end
    else
      letter_array.each do |letter|
        number_array.each do |number|

          grid << @cells["#{letter}#{number}"].render
        end
      end
    end
    grid.each_slice(4).to_a
    grid.insert(0, " 1 2 3 4")
    grid.insert(1, "\nA")
    grid.insert(6, "\nB")
    grid.insert(11, "\nC")
    grid.insert(16, "\nD")
    grid.insert(21, "\n")

    grid.join(' ')
  end
end

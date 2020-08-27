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
  end

  def valid_coordinate?(coord)
    @cells.keys.include?(coord)
  end

  def valid_placement?(ship, placement)
    horizontal_placement(placement)
  end
  #     @cells.keys.each_cons(placement.length).map do |coords|
  #       if coords.include? placement == true
  #         true
  #       else
  #         false
  #       end
  #     end
  def horizontal_placement(placement)
    index = 1
    index2 = true

    placement.each do |coords|
      if coords.ord == placement[index].ord
        index2 = true
      elsif coords.ord != placement[index].ord
        index2 = false
        break
      end
      index += 1
    end
    index2
  end
  member?

  ship length 3 needs either 3 letters or three numbers

      # compare Array of cells against input array
      # iterating through the cell array to make up mini arrays
      # that are the length of the input
      # check if input array is included in any of the cell arrays
      # (Overlap)



end

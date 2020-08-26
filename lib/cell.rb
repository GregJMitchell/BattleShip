require './lib/ship'

class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    if @ship.nil?
      true
    else
      false
    end
  end

  def place_ship(new_ship)
    @ship = new_ship
  end

  def fired_upon?
    if @ship.health < @ship.length
      true
    else
      false
    end
  end

  def fire_upon
    @ship.hit
  end

  def render(player = nil)
    if @ship.sunk? == true
      'X'
    elsif fired_upon? == true
      'H'
    elsif player == nil
      '.'
    else
      'S'
    end
  end
end

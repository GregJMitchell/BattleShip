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
end

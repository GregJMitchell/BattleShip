class Cell

attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(new_ship)
    @ship = new_ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if empty?
      @fired_upon = true
    else
      @fired_upon = true
      @ship.hit
    end
  end

  def render(player = false)
    if empty? && fired_upon? == true
      'M'
    elsif empty? == true
      '.'
    elsif @ship.sunk? == true
      'X'
    elsif fired_upon? == true && empty? == false
      'H'
    elsif player == false
      '.'
    elsif player == true
      'S'
    end
  end
end

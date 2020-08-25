class Cell

attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end
  
  def empty?
    if @ship != @coordinate
     true
    else
     false
    end
  end
end

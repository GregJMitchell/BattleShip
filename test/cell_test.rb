require './lib/cell'
require './lib/ship'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_readable_attributes
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
    assert_equal nil, cell.ship
    assert_equal true, cell.empty?
  end

  def test_it_can_place_a_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal "Cruiser", cell.ship.name
    assert_equal false, cell.empty?
  end

  def test_it_can_be_fired_upon?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?

    cell.fire_upon
    
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end

  def test_it_can_render
    cell1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell2 = Cell.new("C3")
    cell2.place_ship(cruiser)

    assert_equal ".", cell2.render
    assert_equal "S", cell2.render(true)

    cell2.fire_upon
    
    assert_equal 'H', cell2.render

    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?
    assert_equal 'X', cell2.render
  end
end

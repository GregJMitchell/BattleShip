require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_it_exists
    ship = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship
  end

  def test_it_has_readable_attributes
    ship = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", ship.name
    assert_equal 3, ship.length
    assert_equal 3, ship.health
  end

  def test_sunk?
    ship = Ship.new("Cruiser", 3)

    assert_equal false, ship.sunk?

    ship2 = Ship.new("Cruiser", 0)

    assert_equal true, ship2.sunk?
  end

  def test_hit
    ship = Ship.new("Cruiser", 3)
    ship.health

    assert_equal 3, ship.health

    ship.hit
    assert_equal 2, ship.health
  end

end

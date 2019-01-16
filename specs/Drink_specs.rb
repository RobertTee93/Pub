require("minitest/autorun")
require("minitest/rg")
require_relative("../Drink")

class TestDrink < MiniTest::Test

  def setup
    @drink = Drink.new("Vodka", 3.50, 6)
  end

  def test_drink_has_name
    assert_equal("Vodka", @drink.name)
  end

  def test_drink_has_price
    assert_equal(3.50, @drink.price)
  end

  def test_drink_has_alcohol_level
    assert_equal(6, @drink.alcohol_level)
  end

end

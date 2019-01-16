require("minitest/autorun")
require("minitest/rg")
require_relative("../Pub")
require_relative("../Customer")
require_relative("../Drink")
require_relative("../Food")

class TestFood < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", 4, 4)
    @drink2 = Drink.new("Vodka", 3.50, 6)
    @drink3 = Drink.new("Gin", 3, 5)
    @customer = Customer.new("John", 50, 30)
    @food = Food.new("Chips", 2.50, 2)
  end

  def test_food_has_name
    assert_equal("Chips", @food.name)
  end


  def test_food_has_price
    assert_equal(2.50, @food.price)
  end

  def test_has_rejuvenation_level
    assert_equal(2, @food.rejuvenation_level)
  end





end

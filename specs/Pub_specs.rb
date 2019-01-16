require("minitest/autorun")
require("minitest/rg")
require_relative("../Pub")
require_relative("../Customer")
require_relative("../Drink")
require_relative("../Food")

class TestPub < MiniTest::Test

  def setup
    @customer = Customer.new("John", 50, 30)
    @drink1 = Drink.new("Beer", 4, 4)
    @drink2 = Drink.new("Vodka", 3.50, 6)
    @drink3 = Drink.new("Gin", 3, 5)
    @food1 = Food.new("Chips", 2.50, 2)
    @food2 = Food.new("Pizza", 5, 4)
    @food3 = Food.new("Burger", 4, 3)
    @pub = Pub.new("The howling wolf", 1200, [@drink1, @drink2, @drink3], [@food1, @food2, @food3])
  end

  def test_pub_has_name
    assert_equal("The howling wolf", @pub.name)
  end

  def test_till_has_money
    assert_equal(1200, @pub.till)
  end

  def test_pub_has_drinks
    assert_equal(3, @pub.count_drinks)
  end

  def test_pub_can_get_drink
    returned_drink = @pub.get_drink("Vodka")
    assert_equal("Vodka", returned_drink.name)
    assert_equal(2, @pub.count_drinks)
  end

  def test_if_pub_can_sell_drink
    @pub.sell_drink(@customer, @drink1)
    assert_equal(1204, @pub.till)
    assert_equal(2, @pub.count_drinks)
  end

  def test_if_pub_can_sell_drink__too_drunk
    drunk_customer = Customer.new("Colin", 50, 70)
    assert_equal("Too drunk", @pub.sell_drink(drunk_customer, @drink1))
  end

  def test_if_pub_can_sell_drink__not_old_enough
    young_customer = Customer.new("Robert", 20, 16)
    assert_equal("Too young", @pub.sell_drink(young_customer, @drink1))
  end


  def test_customer_is_old_enough
    assert_equal(true, @pub.check_age(@customer))
  end

  def test_customer_is_old_enough__not_old_enough
    young_customer = Customer.new("Robert", 20, 16)
    assert_equal(false, @pub.check_age(young_customer))
  end

  def test_customer_is_too_drunk
    assert_equal(false, @pub.check_if_too_drunk(@customer))
  end

  def test_pub_stock__after_removing_drink
    @pub.sell_drink(@customer, @drink1)
    assert_equal(2, @pub.stock)
  end

  def test_if_pub_has_stock
    assert_equal(3, @pub.stock)
  end

  def test_stock_value
    assert_equal(10.50, @pub.stock_value)
  end

end

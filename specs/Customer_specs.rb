require("minitest/autorun")
require("minitest/rg")
require_relative("../Pub")
require_relative("../Customer")
require_relative("../Drink")
require_relative("../Food")

class TestCustomer < MiniTest::Test

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

  def test_customer_has_name
    assert_equal("John", @customer.name)
  end

  def test_customer_has_money_in_wallet
    assert_equal(50, @customer.wallet)
  end

  def test_customer_can_buy_drink
    @customer.buy_drink(@drink1)
    assert_equal(46, @customer.wallet)
  end

  def test_customer_can_buy_drink__not_enough_money
    poor_customer = Customer.new("John", 1, 18)
    assert_equal("Sorry, not enough money", poor_customer.buy_drink(@drink1))
  end

  def test_customer_check_drunkeness_is_zero
    assert_equal(0, @customer.drunkeness())
  end

  def test_check_if_customer_drunkeness_can_increase
    @customer.drinks(@drink1)
    assert_equal(4, @customer.drunkeness)
  end

  def test_if_customer_can_buy_food
    @customer.buy_food(@food1)
    assert_equal(47.50, @customer.wallet)
  end

  def test_if_customer_can_buy_food__not_enough_money
    poor_customer = Customer.new("John", 1, 18)
    assert_equal("Sorry, not enough money", poor_customer.buy_food(@food1))
  end

  def test_check_if_customer_drunkeness_can_decrease
    @customer.drinks(@drink1)
    @customer.eat(@food1)
    assert_equal(2, @customer.drunkeness)
  end
end

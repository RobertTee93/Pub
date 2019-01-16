# require("Pry")

class Pub
  attr_accessor :name, :till, :drinks, :food, :stock

  def initialize(name, till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
    @stock = @drinks.length
  end

  def count_drinks()
    @drinks.count
  end

  def get_drink(drink_name)
    for drink in @drinks
      if drink_name == drink.name
        @drinks.delete(drink)
        return drink
      end
    end

  end

  def sell_drink(customer, drink)
    if check_age(customer) == true
      if check_if_too_drunk(customer) == false
        customer.buy_drink(drink)
        @till += drink.price
        @stock -= 1
        get_drink(drink.name)
      end
      return "Too drunk"
    end
    return "Too young"
  end

  def check_age(customer)
    if customer.age >= 18
      return true
    end
    return false
  end

  def check_if_too_drunk(customer)
    if customer.drunkeness >= 30
      return true
    end
    return false
  end

  def stock_value()
    total_value = 0
    for drink in @drinks
      total_value += drink.price
    end
    return total_value
  end
end

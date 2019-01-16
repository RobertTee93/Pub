require("Pry")
class Customer
  attr_accessor :name, :wallet, :age, :drunkeness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = 0
  end

  def buy_drink(drink)
    if @wallet >= drink.price
      @wallet -= drink.price
      return drink
    end
    return "Sorry, not enough money"
  end

  def drinks(drink)
    @drunkeness += drink.alcohol_level
  end

  def buy_food(food)
    if @wallet >= food.price
      @wallet -= food.price
      return food
    end
    return "Sorry, not enough money"
  end

  def eat(food)
    @drunkeness -= food.rejuvenation_level
  end
end

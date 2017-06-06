class Wallet
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end
end

class Buyer
  attr_accessor :dishes, :wallet

  def initialize
    @dishes = []
    @wallet = Wallet.new(7.00)
  end
end

class Dish
  attr_accessor :dish_name, :price

  def initialize(dish_name, price)
    @dish_name = dish_name
    @price = price
  end
end

class LunchLady
  attr_accessor :buyer

  def initialize
    @buyer = Buyer.new
    process_buyer
  end

  def pick_main_dish
    puts "What main dish would you like?
      1: Hot Dog(5.00)
      2: Animal Organs(3.00)
      3: Tacos(1.00)"
    case gets.strip
      when '1'
        buyer.dishes << Dish.new("Hot Dog", 5.00)
      when '2'
        buyer.dishes << Dish.new("Animal Organs", 3.00)
      when '3'
         buyer.dishes << Dish.new("Tacos", 1.00)
      else
        puts "You did not select a correct main dish number. Please try again."
        pick_main_dish
    end
  end

  def pick_side_dish
    puts "What side dish would you like?
      1: Jello(1.75)
      2: Yogurt(1.00)
      3: Salad(.50)"
    case gets.strip
      when '1'
        buyer.dishes << Dish.new("Jello", 1.75)
      when '2'
        buyer.dishes << Dish.new("Yogurt", 1.00)
      when '3'
         buyer.dishes << Dish.new("Salad", 0.50)
      else
        puts "You did not select a correct side dish number. Please try again."
        pick_side_dish
    end
  end

  def repeat_order
    puts "Your order consists of:"
    puts buyer.dishes.map(&:dish_name).join(',')
  end

  def total_order
    puts "Your order total is: #{buyer.dishes.map(&:price).inject(:+)}"
  end

  def process_buyer
    pick_main_dish
    2.times { pick_side_dish }
    repeat_order
    total_order
  end
end

LunchLady.new

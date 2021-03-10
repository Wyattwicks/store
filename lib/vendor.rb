class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)

  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

 #Got stuck with this method and spent way too long trying to figure it out. :(
  def potential_revenue
      @inventory.sum do |item, stock|
        item.price_int * check_stock(item)
      end
  end
end

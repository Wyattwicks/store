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

  def potential_revenue
      @inventory.find_all do |price|
        price_int = price.delete('$').to_i
        price_int * @inventory[item]
      end
  end

end
